// custom_app_bar.dart

import 'package:flutter/material.dart';

class CustomAppBar2 extends StatefulWidget implements PreferredSizeWidget {
  final String page_title;
  final String? page_title2;
  final int? page_loading;

  const CustomAppBar2({
    Key? key,
    required this.page_title,
    this.page_title2,
    this.page_loading,
  }) : super(key: key);

  @override
  State<CustomAppBar2> createState() => _CustomAppBar2State();

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class _CustomAppBar2State extends State<CustomAppBar2> {
  late String page_title;
  late String? page_title2;
  late int? page_loading;

  @override
  void initState() {
    super.initState();
    page_title = widget.page_title;
    page_title2 = widget.page_title2;
    page_loading = widget.page_loading;
  }

  // Method to hide the loading indicator
  void hideLoading() {
    setState(() {
      page_loading = 0;
    });
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
                Text(
                  page_title,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  page_title2 ??
                      '', // Use an empty string if page_title2 is null
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            ),
            Container(
              width: 100,
              alignment: Alignment.centerRight,
              child: Column(
                children: [
                  if (page_loading == 1) ...{
                    CircularProgressIndicator(),
                  },
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
