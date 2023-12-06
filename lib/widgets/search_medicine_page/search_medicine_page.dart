import 'package:flutter/material.dart';
import 'package:kapil11/widgets/custom_app_bar2.dart';

class search_medicine_class extends StatelessWidget {
  const search_medicine_class({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(page_title: "Search Medicine"),
      body: Text("hello"),
    );
  }
}
