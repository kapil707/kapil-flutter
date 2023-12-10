import 'package:flutter/material.dart';
import 'package:kapil11/medicine_search/medicine_search_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Home Page'),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MedicineSearchClass(),
              ),
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            // Handle settings button tap
          },
        ),
        // Add more action buttons as needed
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.green],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
