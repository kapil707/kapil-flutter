import 'package:flutter/material.dart';
import 'package:kapil11/widgets/custom_app_bar2.dart';

class UserAccountClass extends StatefulWidget {
  const UserAccountClass({super.key});

  @override
  State<UserAccountClass> createState() => _UserAccountClassState();
}

class _UserAccountClassState extends State<UserAccountClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar2(page_title: "Account"), body: Text("work"));
  }
}
