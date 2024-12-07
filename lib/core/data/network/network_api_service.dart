import 'dart:convert';

import 'package:http/http.dart' as http;

import 'base_api_service.dart';

class NetworkService extends BaseNetworkService {
  @override
  Future<dynamic> getRequest(String url, {Map<String, String>? headers}) async {
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      return _handleResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> postRequest(String url,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body != null ? jsonEncode(body) : null,
      );
      return _handleResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> putRequest(String url,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: headers,
        body: body != null ? jsonEncode(body) : null,
      );
      return _handleResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> deleteRequest(String url,
      {Map<String, String>? headers}) async {
    try {
      final response = await http.delete(Uri.parse(url), headers: headers);
      return _handleResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Error: ${response.statusCode}, Message: ${response.body}');
    }
  }
}
