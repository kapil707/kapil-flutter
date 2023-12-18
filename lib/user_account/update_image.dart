import 'package:flutter/material.dart';
import 'package:kapil11/widgets/custom_app_bar2.dart';

class UserUpdateImageClass extends StatefulWidget {
  const UserUpdateImageClass({super.key});

  @override
  State<UserUpdateImageClass> createState() => _UserUpdateImageClassState();
}

class _UserUpdateImageClassState extends State<UserUpdateImageClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar2(page_title: "Update Image"), body: Text("work"));
  }
}
