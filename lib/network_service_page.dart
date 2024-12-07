import 'package:flutter/material.dart';

import 'core/data/network/network_api_service.dart';

class NetworkExamplePage extends StatefulWidget {
  @override
  _NetworkExamplePageState createState() => _NetworkExamplePageState();
}

class _NetworkExamplePageState extends State<NetworkExamplePage> {
  final NetworkService _networkService = NetworkService();
  String _response = "Press a button to see the result";

  Future<void> handlePostRequest() async {
    const String url = "https://jsonplaceholder.typicode.com/posts";
    final Map<String, dynamic> body = {
      "title": "foo",
      "body": "bar",
      "userId": 1,
    };

    try {
      final response = await _networkService.postRequest(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );
      setState(() {
        _response = "POST Response: $response";
      });
    } catch (e) {
      setState(() {
        _response = "Error in POST Request: $e";
      });
    }
  }

  Future<void> handlePutRequest() async {
    const String url = "https://jsonplaceholder.typicode.com/posts/1";
    final Map<String, dynamic> body = {
      "id": 1,
      "title": "foo updated",
      "body": "bar updated",
      "userId": 1,
    };

    try {
      final response = await _networkService.putRequest(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );
      setState(() {
        _response = "PUT Response: $response";
      });
    } catch (e) {
      setState(() {
        _response = "Error in PUT Request: $e";
      });
    }
  }

  Future<void> handleDeleteRequest() async {
    const String url = "https://jsonplaceholder.typicode.com/posts/1";

    try {
      final response = await _networkService.deleteRequest(
        url,
        headers: {"Content-Type": "application/json"},
      );
      setState(() {
        _response = "DELETE Response: $response";
      });
    } catch (e) {
      setState(() {
        _response = "Error in DELETE Request: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Network Service Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: handlePostRequest,
            child: const Text("Send POST Request"),
          ),
          ElevatedButton(
            onPressed: handlePutRequest,
            child: const Text("Send PUT Request"),
          ),
          ElevatedButton(
            onPressed: handleDeleteRequest,
            child: const Text("Send DELETE Request"),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _response,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
