import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kapil11/home_page/home_page.dart';
import 'package:kapil11/login_page.dart';
import 'package:kapil11/session.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home_page_class(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => login_page_class(),
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
        color: Colors.blue,
        child: const Center(
          child: Text(
            'D.R. Distributor',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
