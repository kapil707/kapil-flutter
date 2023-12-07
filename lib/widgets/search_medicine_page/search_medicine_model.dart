import 'dart:convert';

import 'package:kapil11/utility/app_urls.dart';
import 'package:http/http.dart' as http;

class search_medicine_model {
  static api_call(_keyword) async {
    var _url = AppUrls.search_page;
    var _body = {
      'submit': '98c08565401579448aad7c64033dcb4081906dcb',
      'keyword': _keyword,
    };
    var uri = Uri.parse(_url);
    var response = await http.post(uri, body: _body);
    //final response = await http.post(uri);

    return response;
  }
}
