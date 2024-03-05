import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kapil11/login/login_model.dart';
import 'package:kapil11/new_api.dart';
import 'package:kapil11/new_login/login_model.dart';
import 'package:kapil11/session.dart';
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
  final apiService = MyApiService(Dio());

  var username = TextEditingController();
  var password = TextEditingController();
  var login_status_message = "";
  bool isLoading = false;

  void _functionLogin(_context,String _username, String _password) async {
    setState(() { isLoading = true; });
    try {
      final response = await apiService.get_login_api("xx",_username, _password,"");
      final status = response.items.first.status;
      final status_message = response.items.first.status_message;      
      if(status.toString()=="0")
      {
        Fluttertoast.showToast(
            msg: status_message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        //AppAlertBox.showAlertDialog(_context, "Error", status_message);
        setState(() {
          isLoading = false;
          login_status_message = status_message;
        });
      }
      if(status.toString()=="1")
      {
        setState(() {
          isLoading = false;
          login_status_message = status_message;
        });

          var user_session = response.items.first.user_session;
          var user_fname = response.items.first.user_fname;
          var user_code = response.items.first.user_code;
          var user_altercode = response.items.first.user_altercode;
          var user_type = response.items.first.user_type;
          var user_password = response.items.first.user_password;
          var user_image = response.items.first.user_image;
          var user_nrx = response.items.first.user_nrx;
          // session me values set iss say hoti ha
          Shared.saveLoginSharedPreference(
                  true,
                  user_type,
                  user_code,
                  user_altercode,
                  user_password,
                  user_image,
                  user_fname,
                  user_nrx)
              .then((value) {});

          Navigator.pushReplacement(
            _context,
            MaterialPageRoute(
              builder: (context) => const SplashScreenClass(),
            ),
          );
      }
    } catch (e) {
      // Handle login error
      print('Login error: $e');
    }
  }

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
                  Text("Enter username"),
                  MyTextField(
                    mytextController: username,
                    myhintText: "Enter username....",
                    myprefixIcon: Icon(Icons.account_box),
                  ),
                  Container(height: 11),
                  Text("Enter password"),
                  MyPasswordTextField(
                    mytextController: password,
                  ),
                  Container(height: 11),
                  Center(child: Text(login_status_message)),
                  Container(height: 11),
                  Center(
                    child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                      if (isLoading) CircularProgressIndicator(),],),
                  ),
                  if (isLoading==false)
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
                            _functionLogin(context,_username, _password);
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
