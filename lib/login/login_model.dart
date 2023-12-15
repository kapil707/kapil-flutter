import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:kapil11/session.dart';
import 'package:kapil11/splash_screen.dart';
import 'package:kapil11/utility/api_service.dart';
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
      AppAlertBox.showAlertDialog(_context, "working", "working1");

      var _url = AppUrls.login_api;
      var _body = {
        'api_key': '98c08565401579448aad7c64033dcb4081906dcb',
        'user_name': _username,
        'user_password': _password
      };
      var uri = Uri.parse(_url);
      var response = await http.post(uri, body: _body);

      var mybody = json.decode(response.body);
      AppAlertBox.showAlertDialog(_context, "working", "working2");
      final result = mybody["items"];
      //print(result);
      AppAlertBox.showAlertDialog(
          _context, "working", result[0]["return_message"]);
      if (result[0]["return_status"] == "0") {
        AppAlertBox.showAlertDialog(
            _context, "Error", result[0]["return_message"]);
      } else {
        var dt = mybody["items"];

        var user_id = dt[0]["user_id"].toString();
        var user_fname = dt[0]["user_fname"].toString();
        var user_code = dt[0]["user_code"].toString();
        var user_altercode = dt[0]["user_altercode"].toString();
        var user_type = dt[0]["user_type"].toString();
        var user_password = dt[0]["user_password"].toString();
        var user_image = dt[0]["user_image"].toString();

        var user_division = dt[0]["user_division"].toString();
        var user_compcode = dt[0]["user_compcode"].toString();
        var otp_type = dt[0]["otp_type"].toString();
        var otp_sms = dt[0]["otp_sms"].toString();
        var otp_massage_txt = dt[0]["otp_massage_txt"].toString();
        var user_nrx = dt[0]["user_nrx"].toString();
        // session me values set iss say hoti ha
        Shared.saveLoginSharedPreference(true, user_type, user_id, user_code,
                user_altercode, user_password, user_image, user_fname, user_nrx)
            .then((value) {});

        Navigator.pushReplacement(_context,
            MaterialPageRoute(builder: (context) => SplashScreenClass()));
      }
    }
  }
}
