import 'package:api_call/crud_operations/fetch_data.dart';
import 'package:api_call/crud_operations/post_data.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("API Call"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Center(
          child: Column(
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FetchData(),
                    ));
                  },
                  icon: const Icon(Icons.get_app),
                  label: const Text("Fetch Data")),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PostData(),
                    ));
                  },
                  icon: const Icon(Icons.send),
                  label: const Text("Post Data")),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.update),
                  label: const Text("Update Data")),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.delete),
                  label: const Text("Delete Data")),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
