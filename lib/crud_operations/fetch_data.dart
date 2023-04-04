import 'package:api_call/api_provider.dart';
import 'package:flutter/material.dart';

class FetchData extends StatefulWidget {
  const FetchData({Key? key}) : super(key: key);

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  ApiProvider apiProvider = ApiProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fetch Data"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 50,
            child: FutureBuilder(
              future: apiProvider.getPost(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  return SizedBox(
                    height: 500,
                    child: Card(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return ListTile(
                            trailing: CircleAvatar(
                                child: Text(
                                    snapshot.data![index].userId.toString())),
                            title: Text(snapshot.data![index].title.toString()),
                            subtitle:
                                Text(snapshot.data![index].body.toString()),
                          );
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
