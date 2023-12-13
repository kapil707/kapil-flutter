import 'package:flutter/material.dart';
import 'package:kapil11/widgets/custom_app_bar2.dart';

class MyCartClass extends StatelessWidget {
  const MyCartClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(page_title: "My Cart"),
      body: Container(
        child: Text("My Cart"),
      ),
    );
  }
}
