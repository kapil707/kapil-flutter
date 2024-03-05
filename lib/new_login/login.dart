import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:kapil11/login/login_model.dart';
import 'package:kapil11/new_api.dart';
import 'package:kapil11/new_login/login_model.dart';
import 'package:kapil11/splash_screen.dart';
import 'package:kapil11/uitheme/style.dart';
import 'package:kapil11/utility/api_service.dart';
import 'package:kapil11/utility/app_alertbox.dart';
import 'package:kapil11/utility/app_urls.dart';
import 'package:kapil11/widgets/inputs_desions.dart';
import 'package:http/http.dart' as http;

class LoginClass extends StatefulWidget {
  const LoginClass({super.key});

  @override
  State<LoginClass> createState() => _LoginClassState();
}

class _LoginClassState extends State<LoginClass> {
  var username = TextEditingController();
  var password = TextEditingController();

  final MyApiService myApiService = MyApiService(Dio());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.amberAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(
                      500), // Set the bottom-left border radius here
                ),
              ),
              height: 200,
              child: Center(
                child: Image.asset(
                  'assets/images/logo4.png',
                  width: 100,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(height: 92),
                  Text("Enter UserName"),
                  MyTextField(
                    mytextController: username,
                    myhintText: "Enter UserName....",
                    myprefixIcon: Icon(Icons.account_box),
                  ),
                  Container(height: 11),
                  Text("Enter Password"),
                  MyPasswordTextField(
                    mytextController: password,
                  ),
                  Container(height: 11),
                  Center(
                    child: Container(
                      width: 150,
                      child: Mybutton(
                        btnName: "Login",
                        btnIcon: Icon(Icons.lock),
                        btnStyle: mTextStyle11(),
                        callBack: () {
                          String _username = username.text.toString();
                          String _password = password.text.toString();
                          //print(ue);
                          //login_model.api_call(context, _username, _password);
                          FutureBuilder<LoginModelResponse>(
            future: myApiService.get_login_api("xx","v153","123456789",""),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final userItem = snapshot.data!.items.first;
                return Text('Status Message: ${userItem.user_session}');
              }
            },
          ),
                        },
                      ),
                    ),
                  ),
                  Container(height: 100),
                  Center(
                    child: const Text(
                      "D R Distributors Pvt Ltd",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Center(
                    child: const Text(
                      "Website version 44",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
