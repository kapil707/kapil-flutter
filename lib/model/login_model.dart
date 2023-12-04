import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:kapil11/home_page.dart';
import 'package:kapil11/splash_screen.dart';
import 'package:kapil11/utility/app_alertbox.dart';
import 'package:kapil11/utility/app_urls.dart';

class login_model {
  static api_call(_context, _username, _password) async {
    if (_username == "") {
      AppAlertBox.showAlertDialog(_context, "Error", "Enter UserName");
    }
    if (_password == "") {
      AppAlertBox.showAlertDialog(_context, "Error", "Enter Password");
    }

    if (_username != "" && _password != "") {
      var _url = AppUrls.login_page_url;
      var _body = {
        'submit': '98c08565401579448aad7c64033dcb4081906dcb',
        'user_altercode': _username,
        'user_password': _password
      };
      var uri = Uri.parse(_url);
      var response = await http.post(uri, body: _body);
      //final response = await http.post(uri);
      var body = response.body;
      var json = jsonDecode(body);

      final result = json["items"];
      //print(result[0]["user_session"]);
      if (result[0]["user_return"] == "0") {
        AppAlertBox.showAlertDialog(_context, "Error", result[0]["user_alert"]);
      } else {
        Navigator.pushReplacement(
            _context, MaterialPageRoute(builder: (context) => Home_page()));
      }
    }
  }
}
