import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_check/models/ResponseModel.dart';

abstract class NewsService {

  static final _address = "<INSERT YOUR IPv4 HERE>";

  static Future<bool> validateUrl(String text) async {
    String url = "http://$_address:5000/checkUrl";
    Map<String, String> headers = {"Content-type": "application/json"};

    Response response = await post(url, headers: headers, body: text);

    var answer = ResponseModel.fromJson(jsonDecode(response.body));

    if (answer.id == 0)
      return answer.content  == 'True';
    else
      throw new Exception(answer.content);
  }

  static Future<bool> validateText(String text) async{
    String url = "http://$_address:5000/checkText";
    Map<String, String> headers = {"Contant-type": "application/json"};

    Response response = await post(url, headers: headers, body: text);

    var answer = ResponseModel.fromJson(jsonDecode(response.body));

    if (answer.id == 0)
      return answer.content  == 'True';
    else
      throw new Exception(answer.content);
  }
}