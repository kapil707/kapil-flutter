import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App_drawer_class extends StatefulWidget {
  @override
  State<App_drawer_class> createState() => _App_drawer_classState();
}

class _App_drawer_classState extends State<App_drawer_class> {
  late String session_user_fname = "";
  late String session_user_altercode = "";
  late String session_user_image = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    page_load();
  }

  page_load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? _session_user_fname = prefs.getString('user_fname');
    String? _session_user_altercode = prefs.getString('user_altercode');
    String? _session_user_image = prefs.getString('user_image');
    setState(() {
      if (_session_user_fname != null) {
        session_user_fname = _session_user_fname;
      }
      if (_session_user_altercode != null) {
        session_user_altercode = _session_user_altercode;
      }
      if (_session_user_image != null) {
        session_user_image = _session_user_image;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.amber,
      child: ListView(
        children: [
          SizedBox(
            height: 100,
            child: DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/background_image.jpg'), // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    child: Image.network(
                      session_user_image,
                      height: 72, // Specify the height you want
                      width: 72, // Specify the width you want
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          session_user_fname,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          session_user_altercode,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Account",
            ),
          ),
          ListTile(
            title: Text("Account"),
            leading: Icon(Icons.account_box),
          ),
          ListTile(
            title: Text("Update account"),
            leading: Icon(Icons.edit),
          ),
          ListTile(
            title: Text("Update image"),
            leading: Icon(Icons.camera_alt),
          ),
          ListTile(
            title: Text("Update password"),
            leading: Icon(Icons.key),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Account",
            ),
          ),
          ListTile(
            title: Text("Account"),
            leading: Icon(Icons.account_box),
          ),
          ListTile(
            title: Text("Update account"),
            leading: Icon(Icons.edit),
          ),
          ListTile(
            title: Text("Update image"),
            leading: Icon(Icons.camera_alt),
          ),
          ListTile(
            title: Text("Update password"),
            leading: Icon(Icons.key),
          ),
        ],
      ),
    );
  }
}
