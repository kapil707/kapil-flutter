import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kapil11/utility/app_urls.dart';

class ApiService {
  static Future<http.Response> searchMedicine(String _keyword) async {
    var _url = AppUrls.search_page;
    var _body = {
      'api_key': '98c08565401579448aad7c64033dcb4081906dcb',
      'keyword': _keyword,
    };
    var uri = Uri.parse(_url);
    var response = await http.post(uri, body: _body);
    return response;
  }
}
