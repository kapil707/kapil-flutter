// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class home_box_title_class extends StatefulWidget {
  final String title;

  const home_box_title_class({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<home_box_title_class> createState() => _home_box_title_classState();
}

class _home_box_title_classState extends State<home_box_title_class> {
  var title;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 120,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(100.0),
            bottomRight: Radius.circular(100.0),
          ),
          border: Border.all(
            color: Colors.green,
            width: 2.0,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: const Color.fromARGB(255, 98, 95, 95)),
          ),
        ),
      ),
    );
  }
}
