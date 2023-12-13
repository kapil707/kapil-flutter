import 'package:flutter/material.dart';
import 'package:kapil11/medicine_search/medicine_search_page.dart';
import 'package:kapil11/my_cart/my_cart_page.dart';
import 'package:kapil11/widgets/inputs_desions.dart';

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
        IconButtonWithText(
          icon: Icons.shopping_bag,
          text: "3",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyCartClass(),
              ),
            );
          },
        ),
        // Add more action buttons as neededs
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
