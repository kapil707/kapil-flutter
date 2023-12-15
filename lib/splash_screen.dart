import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:kapil11/utility/app_urls.dart';
import 'package:kapil11/widgets/custom_app_bar.dart';
import 'package:kapil11/home/home_page.dart';
import 'package:kapil11/login/login_page.dart';
import 'package:kapil11/session.dart';
import 'package:kapil11/medicine_search/medicine_search_page.dart';

class SplashScreenClass extends StatefulWidget {
  const SplashScreenClass({super.key});

  @override
  State<SplashScreenClass> createState() => _SplashScreenClassState();
}

class _SplashScreenClassState extends State<SplashScreenClass> {
  var islogin;
  @override
  void initState() {
    super.initState();
    checkUserLoginState();
    // Timer(const Duration(seconds: 2), () {
    //   checkUserLoginState();
    // });
  }

  checkUserLoginState() async {
    await Shared.getUserSharedPreferences().then((value) async {
      islogin = value;
      if (islogin == true) {
        var _url = AppUrls.home_page_api;
        var uri = Uri.parse(_url);
        final response = await http.post(uri);
        var body = response.body;
        var json = jsonDecode(body);

        //print(json);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeClass(json_values: json),
          ),
        );
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => Myapicall(),
        //   ),
        // );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginClass(),
          ),
        );
      }
      //setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.amberAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircularProgressIndicator(),
            Container(height: 11),
            Text(
              'D.R. Distributor',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                color: Colors.white,
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
            Container(height: 100),
          ],
        ),
      ),
    );
  }
}
