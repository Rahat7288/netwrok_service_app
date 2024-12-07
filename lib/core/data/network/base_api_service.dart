abstract class BaseNetworkService {
  Future<dynamic> getRequest(String url, {Map<String, String>? headers});
  Future<dynamic> postRequest(String url,
      {Map<String, String>? headers, Map<String, dynamic>? body});
  Future<dynamic> putRequest(String url,
      {Map<String, String>? headers, Map<String, dynamic>? body});
  Future<dynamic> deleteRequest(String url, {Map<String, String>? headers});
}
