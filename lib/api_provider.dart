import 'dart:convert';

import 'package:api_call/posts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiProvider {
  String get baseUrl => "https://jsonplaceholder.typicode.com";

  String get endPoint => "/posts";

  String get url => baseUrl + endPoint;

  ///Todo Fetch Data
  Future<List<Posts>> getPost() async {
    List<Posts> posts = [];
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> postList = jsonDecode(response.body.toString());
        for (var postsItems in postList) {
          Posts post = Posts.fromMap(postsItems);
          posts.add(post);
          print(posts);
        }
      }
    } catch (e) {
      print(e);
    }
    return posts;
  }

  ///Todo Register User
  void register(String email, password) async {
    try {
      Response response =
          await post(Uri.parse("https://reqres.in/api/register"), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
       print("Successfully Registered");
      } else {
        print("Failed Registered");
      }
    } catch (e) {
      print(e);
    }
  }

  ///ToDo Insert Data
  void insertData(String name, job) async {
    try {
      Response response =
      await post(Uri.parse("https://reqres.in/api/users"), body: {
        'name': name,
        'job': job,
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print("The Data Token is ${data['token']}");
        print("Successfully Inserted");
      } else {
        print("Failed Inserted");
      }
    } catch (e) {
      print(e);
    }
  }

}
