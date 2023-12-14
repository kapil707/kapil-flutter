import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kapil11/utility/app_urls.dart';

class ApiService {
  static Future<http.Response> login_api(
      String _username, String _password) async {
    var _url = AppUrls.login_api;
    var _body = {
      'api_key': '98c08565401579448aad7c64033dcb4081906dcb',
      'user_name': _username,
      'user_password': _password
    };
    var uri = Uri.parse(_url);
    var response = await http.post(uri, body: _body);
    return response;
  }

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

  static Future<http.Response> medicine_add_to_cart_api(
      String _item_order_quantity, String _item_code) async {
    var _url = AppUrls.medicine_add_to_cart_api;
    var _body = {
      'api_key': '98c08565401579448aad7c64033dcb4081906dcb',
      'item_order_quantity': _item_order_quantity,
      'item_code': _item_code,
      'user_altercode': 'v153',
      'user_password': 'f5bb0c8de146c67b44babbf4e6584cc0',
      'user_type': 'chemist',
      'order_type': 'flutter',
      'mobilenumber': 'xxxx',
      'modalnumber': 'xxxx',
      'device_id': 'xxxx',
    };
    var uri = Uri.parse(_url);
    var response = await http.post(uri, body: _body);
    return response;
  }

  static Future<http.Response> my_cart_api() async {
    var _url = AppUrls.my_cart_api;
    var _body = {
      'api_key': '98c08565401579448aad7c64033dcb4081906dcb',
      'device_id': 'xxxx',
      'user_type': 'chemist',
      'user_altercode': 'v153',
      'user_password': 'f5bb0c8de146c67b44babbf4e6584cc0',
      'chemist_id': '',
    };
    var uri = Uri.parse(_url);
    var response = await http.post(uri, body: _body);
    return response;
  }
}
