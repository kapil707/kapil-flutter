import 'package:flutter/material.dart';

class App_drawer_class extends StatelessWidget {
  const App_drawer_class({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/background_image.jpg'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  child: Image.asset(
                    'assets/images/drawer/profile.webp',
                    height: 64,
                    width: 64,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                Text(
                  "Kapil",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text("Account"),
            leading: Icon(Icons.search),
          ),
          ListTile(
            title: Text("Update Account"),
            leading: Icon(Icons.search),
          )
        ],
      ),
    );
  }
}
