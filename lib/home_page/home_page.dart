import 'package:flutter/material.dart';
import 'package:kapil11/home_page/home_box_style.dart';
import 'package:kapil11/widgets/slider/slider_widgets.dart';

class Home_page_class extends StatelessWidget {
  Home_page_class({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        color: const Color.fromARGB(255, 234, 234, 234),
        child: Column(
          children: [
            slider_class(),
            Container(child: Home_box_class(), height: 300),
            Text("Welcome To Home page xx vv"),
            Image.asset(
              'assets/images/logo4.png',
              width: 100,
            ),
            Text("Welcome To Home page xx vv"),
          ],
        ),
      ),
    );
  }
}
