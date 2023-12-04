import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kapil11/model/login_model.dart';
import 'package:kapil11/splash_screen.dart';
import 'package:kapil11/uitheme/style.dart';
import 'package:kapil11/utility/app_alertbox.dart';
import 'package:kapil11/utility/app_api.dart';
import 'package:kapil11/utility/app_urls.dart';
import 'package:kapil11/widgets/inputs_desions.dart';

class login_page_class extends StatefulWidget {
  const login_page_class({super.key});

  @override
  State<login_page_class> createState() => _login_page_classState();
}

class _login_page_classState extends State<login_page_class> {
  var username = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo4.png',
              width: 100,
            ),
            Container(height: 100),
            Text("Enter UserName"),
            MyTextField(
              mytextController: username,
              mylabelText: "UserName",
              myhintText: "Enter UserName....",
              myprefixIcon: Icon(Icons.lock),
            ),
            Container(height: 10),
            Text("Enter Password"),
            MyPasswordTextField(
              mytextController: password,
            ),
            Container(height: 10),
            Container(
              width: 130,
              child: Mybutton(
                btnName: "Login",
                btnIcon: Icon(Icons.lock),
                btnStyle: mTextStyle11(),
                callBack: () {
                  String _username = username.text.toString();
                  String _password = password.text.toString();
                  //print(ue);
                  login_model.api_call(context, _username, _password);
                },
              ),
            ),
            const Text(
              "D R Distributors Pvt Ltd",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const Text(
              "Website version 44",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
