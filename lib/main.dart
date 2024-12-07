import 'package:flutter/material.dart';

import 'core/data/network/network_api_service.dart';
import 'network_service_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: GetRequestExample(),
    );
  }
}

class GetRequestExample extends StatefulWidget {
  @override
  _GetRequestExampleState createState() => _GetRequestExampleState();
}

class _GetRequestExampleState extends State<GetRequestExample> {
  final NetworkService _networkService = NetworkService();
  String _response = "Loading...";

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  ///get example ==============
  Future<void> fetchData() async {
    const String url = "https://jsonplaceholder.typicode.com/posts/1";
    try {
      final data = await _networkService.getRequest(
        url,
        headers: {"Content-Type": "application/json"},
      );
      setState(() {
        _response = data.toString();
      });
    } catch (e) {
      setState(() {
        _response = "Error: $e";
      });
    }
  }

  ///post example ==============
  void createPostExample() async {
    final NetworkService networkService = NetworkService();

    const String url = "https://jsonplaceholder.typicode.com/posts";
    final Map<String, dynamic> body = {
      "title": "foo",
      "body": "bar",
      "userId": 1,
    };

    try {
      final response = await networkService.postRequest(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );
      print("POST Response: $response");
    } catch (e) {
      print("Error in POST Request: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GET Request Example"),
      ),
      body: Column(
        children: [
          Center(
            child: Text(_response),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NetworkExamplePage()));
            },
            child: Text('go to service page'),
          ),
        ],
      ),
    );
  }
}
