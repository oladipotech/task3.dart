import 'dart:async';
import 'package:sky_engine/_http/http.dart' as http;

const baseUrl ="http://jsonplaceholder.typicode.com";

class API {
  static Future getUser() {
    var url = baseUrl + "/user";
    return http.get (url);
  }
}