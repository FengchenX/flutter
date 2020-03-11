import 'dart:convert';
import 'dart:io';

class IOHttpUtils {
  //创建HttpClient
  HttpClient _httpClient = HttpClient();

  dynamic get(String url, [Map<String, String> queryParameters]) async {
    var uri = new Uri.http('localhost:8080', url, queryParameters);
    var request = await _httpClient.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    Map data = json.decode(responseBody);
    return data;
  }
}
