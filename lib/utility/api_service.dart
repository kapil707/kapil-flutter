import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kapil11/utility/app_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static Future<http.Response> login_api(
      String _username, String _password) async {
    var _url = AppUrls.login_api;
    var _body = {
      'api_key': AppUrls.api_key,
      'user_name': _username,
      'user_password': _password,
      'firebase_token': ''
    };
    var uri = Uri.parse(_url);
    var response = await http.post(uri, body: _body);
    return response;
  }

  static Future<http.Response> main_page_api() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_type = prefs.getString('user_type');
    String? user_altercode = prefs.getString('user_altercode');
    String? user_password = prefs.getString('user_password');
    String? chemist_id = "";
    String? firebase_token = "";
    String? device_id = "xxxx";
    String? versioncode = "01";
    String? getlatitude = "";
    String? getlongitude = "";
    String? gettime = "zz";
    String? getdate = "xx";

    var _url = AppUrls.main_page_api;
    var _body = {
      'api_key': AppUrls.api_key,
      'user_type': user_type,
      'user_altercode': user_altercode,
      'user_password': user_password,
      'chemist_id': chemist_id,
      'firebase_token': firebase_token,
      'device_id': device_id,
      'versioncode': versioncode,
      'getlatitude': getlatitude,
      'getlongitude': getlongitude,
      'gettime': gettime,
      'getdate': getdate,
    };
    var uri = Uri.parse(_url);
    var response = await http.post(uri, body: _body);
    return response;
  }

  static Future<http.Response> home_page_api(String _seq_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_type = prefs.getString('user_type');
    String? user_altercode = prefs.getString('user_altercode');
    String? user_password = prefs.getString('user_password');
    String? chemist_id = "";

    var _url = AppUrls.home_page_api;
    var _body = {
      'api_key': AppUrls.api_key,
      'user_type': user_type,
      'user_altercode': user_altercode,
      'user_password': user_password,
      'chemist_id': chemist_id,
      'seq_id': _seq_id,
    };
    var uri = Uri.parse(_url);
    var response = await http.post(uri, body: _body);
    return response;
  }

  static Future<http.Response> search_page_api(String _keyword) async {
    var _url = AppUrls.search_page_api;
    var _body = {
      'api_key': AppUrls.api_key,
      'keyword': _keyword,
    };
    var uri = Uri.parse(_url);
    var response = await http.post(uri, body: _body);
    return response;
  }

  static Future<http.Response> medicine_details_api(item_code) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_type = prefs.getString('user_type');
    String? user_altercode = prefs.getString('user_altercode');
    String? user_password = prefs.getString('user_password');
    String? chemist_id = "";

    var _url = AppUrls.medicine_details_api;
    var _body = {
      'api_key': AppUrls.api_key,
      'user_type': user_type,
      'user_altercode':user_altercode,
      'user_password': user_password,
      'chemist_id': chemist_id,
      'device_id': 'xxxx',
      'item_code':item_code
    };
    var uri = Uri.parse(_url);
    var response = await http.post(uri, body: _body);
    return response;
  }

  static Future<http.Response> medicine_add_to_cart_api(
      String _item_order_quantity, String _item_code) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_type = prefs.getString('user_type');
    String? user_altercode = prefs.getString('user_altercode');
    String? user_password = prefs.getString('user_password');
    String? chemist_id = "";

    var _url = AppUrls.medicine_add_to_cart_api;
    var _body = {
      'api_key': AppUrls.api_key,
      'user_type': user_type,
      'user_altercode':user_altercode,
      'user_password': user_password,
      'chemist_id': chemist_id,
      'device_id': 'xxxx',
      'item_order_quantity': _item_order_quantity,
      'item_code': _item_code,
      'order_type': 'flutter',
      'mobilenumber': 'xxxx',
      'modalnumber': 'xxxx',
    };
    var uri = Uri.parse(_url);
    var response = await http.post(uri, body: _body);
    return response;
  }

  static Future<http.Response> my_cart_api() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_type = prefs.getString('user_type');
    String? user_altercode = prefs.getString('user_altercode');
    String? user_password = prefs.getString('user_password');
    String? chemist_id = prefs.getString('chemist_id');

    var _url = AppUrls.my_cart_api;
    var _body = {
      'api_key': AppUrls.api_key,
      'user_type': user_type,
      'user_altercode':user_altercode,
      'user_password': user_password,
      'chemist_id': chemist_id,
      'device_id': 'xxxx',
      'chemist_id': '',
    };
    var uri = Uri.parse(_url);
    var response = await http.post(uri, body: _body);
    return response;
  }

  static Future<http.Response> my_order_api() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_type = prefs.getString('user_type');
    String? user_altercode = prefs.getString('user_altercode');
    String? user_password = prefs.getString('user_password');
    String? chemist_id = "";

    var _url = AppUrls.my_order_api;
    var _body = {
      'api_key': AppUrls.api_key,
      'user_type': user_type,
      'user_altercode':user_altercode,
      'user_password': user_password,
      'chemist_id': chemist_id,
      'device_id': 'xxxx',
      'get_record': '12',
    };
    print(_body);
    var uri = Uri.parse(_url);
    var response = await http.post(uri, body: _body);
    return response;
  }

  static Future<http.Response> my_invoice_api(get_record) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_type = prefs.getString('user_type');
    String? user_altercode = prefs.getString('user_altercode');
    String? user_password = prefs.getString('user_password');
    String? chemist_id = "";

    var _url = AppUrls.my_invoice_api;
    var _body = {
      'api_key': AppUrls.api_key,
      'user_type': user_type,
      'user_altercode':user_altercode,
      'user_password': user_password,
      'chemist_id': chemist_id,
      'device_id': 'xxxx',
      'get_record': get_record.toString(),
    };
    var uri = Uri.parse(_url);
    var response = await http.post(uri, body: _body);
    return response;
  }

  static Future<http.Response> my_notification_api() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_type = prefs.getString('user_type');
    String? user_altercode = prefs.getString('user_altercode');
    String? user_password = prefs.getString('user_password');
    String? chemist_id = prefs.getString('chemist_id');

    var _url = AppUrls.my_notification_api;
    var _body = {
      'api_key': AppUrls.api_key,
      'user_type': user_type,
      'user_altercode':user_altercode,
      'user_password': user_password,
      'chemist_id': chemist_id,
      'device_id': 'xxxx',
      'get_record': '12',
    };
    var uri = Uri.parse(_url);
    var response = await http.post(uri, body: _body);
    return response;
  }
}
