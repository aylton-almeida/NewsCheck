import 'package:http/http.dart';

abstract class NewsService {
  static Future<bool> validateText(String text) async {
    String url = "http://192.168.2.101:5000/";
    Map<String, String> headers = {"Content-type": "application/json"};

    Response response = await post(url, headers: headers, body: text);

    return response.body == 'True';
  }
}