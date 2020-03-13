import 'dart:convert';
import 'dart:io';

import 'package:untitled1/untitled1.dart' as untitled1;

Future<void> main(List<String> arguments) async {
  Map<String, dynamic> d = await get2();
  print(d['data']['movies']);
  print('Hello world: ${untitled1.calculate()}!');
}

get2() async {
  var httpClient = new HttpClient();
  var uri = Uri.http('localhost:8080', '/movies');
  var request = await httpClient.getUrl(uri);
  var response = await request.close();
  var responseBody = await response.transform(utf8.decoder).join();
  Map<String, dynamic> data = json.decode(responseBody);
  return data;
}
