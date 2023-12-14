// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomAppBar2 extends StatefulWidget implements PreferredSizeWidget {
  final String page_title;
  const CustomAppBar2({
    required this.page_title,
  });

  @override
  State<CustomAppBar2> createState() => _CustomAppBar2State();

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class _CustomAppBar2State extends State<CustomAppBar2> {
  var page_title;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    page_title = widget.page_title;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.amberAccent,
      title: Text(page_title),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
