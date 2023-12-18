import 'package:flutter/material.dart';
import 'package:kapil11/widgets/custom_app_bar2.dart';

class UserUpdatePasswordClass extends StatefulWidget {
  const UserUpdatePasswordClass({super.key});

  @override
  State<UserUpdatePasswordClass> createState() =>
      _UserUpdatePasswordClassState();
}

class _UserUpdatePasswordClassState extends State<UserUpdatePasswordClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar2(page_title: "Update Password"),
        body: Text("work"));
  }
}
