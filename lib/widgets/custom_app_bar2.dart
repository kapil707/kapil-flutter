// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomAppBar2 extends StatefulWidget implements PreferredSizeWidget {
  final String page_title;
  final String? page_title2;
  const CustomAppBar2({
    required this.page_title,
    this.page_title2,
  });

  @override
  State<CustomAppBar2> createState() => _CustomAppBar2State();

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class _CustomAppBar2State extends State<CustomAppBar2> {
  var page_title;
  var page_title2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    page_title = widget.page_title;
    page_title2 = widget.page_title2;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.amberAccent,
      title: Container( 
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(page_title,style: TextStyle(color: Colors.black, fontSize: 20),),
                Text(page_title2,style: TextStyle(color: Colors.black, fontSize: 15),),
              ],
            ),
            Container(
              width: 100,
              alignment: Alignment.centerRight,
              child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
