import 'package:flutter/material.dart';
import 'package:kapil11/widgets/custom_app_bar2.dart';

class UserUpdateAccountClass extends StatefulWidget {
  const UserUpdateAccountClass({super.key});

  @override
  State<UserUpdateAccountClass> createState() => _UserUpdateAccountClassState();
}

class _UserUpdateAccountClassState extends State<UserUpdateAccountClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar2(page_title: "Update Account"),
        body: Text("work"));
  }
}
