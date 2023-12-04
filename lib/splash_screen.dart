import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kapil11/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Mylogin()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          'Welcome',
          style: TextStyle(
            fontSize: 34,
            color: Colors.white,
          ),
        ),
      ),
    ));
  }
}
