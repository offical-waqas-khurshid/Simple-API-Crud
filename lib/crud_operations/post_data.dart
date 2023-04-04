import 'package:api_call/api_provider.dart';
import 'package:flutter/material.dart';

class PostData extends StatefulWidget {
  const PostData({Key? key}) : super(key: key);

  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  ApiProvider apiProvider = ApiProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Data"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            children: [
              SizedBox(
                width: 850,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: "email",
                      fillColor: Colors.white,
                      enabledBorder:
                          Theme.of(context).inputDecorationTheme.enabledBorder,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid email!';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 850,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      fillColor: Colors.white,
                      enabledBorder:
                          Theme.of(context).inputDecorationTheme.enabledBorder,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid password!';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 850,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: "name",
                      fillColor: Colors.white,
                      enabledBorder:
                      Theme.of(context).inputDecorationTheme.enabledBorder,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a your name!';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 850,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: TextFormField(
                    controller: jobController,
                    decoration: InputDecoration(
                      labelText: "job",
                      fillColor: Colors.white,
                      enabledBorder:
                      Theme.of(context).inputDecorationTheme.enabledBorder,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a you job';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    apiProvider.register(emailController.text.toString(),
                        passwordController.text.toString());
                    apiProvider.insertData(nameController.text.toString(),
                        jobController.text.toString());
                  },
                  child: const Text("Done"))
            ],
          ),
        ),
      ),
    );
  }
}
