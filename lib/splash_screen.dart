import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:kapil11/test.dart';
import 'package:kapil11/utility/api_service.dart';
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
        final response = await ApiService.main_page_api();
        var mybody = json.decode(response.body);
        final result = mybody[0]["items"];
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            //builder: (context) => HomeClass(json_values: json),
            builder: (context) => Mytestclass(),
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
            Image.asset(
                  'assets/images/logo4.png',
                  width: 100,
                ),
            Container(height: 11),
            Text(
              'D.R. Distributor',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            CircularProgressIndicator(),
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
