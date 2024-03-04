import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kapil11/home/home_box_title_style.dart';
import 'package:kapil11/home/home_menu.dart';
import 'package:kapil11/utility/api_service.dart';
import 'package:kapil11/widgets/custom_app_bar.dart';
import 'package:kapil11/home/home_box_style.dart';
import 'package:kapil11/home/home_box_style2.dart';
import 'package:kapil11/widgets/drawer_widgets.dart';
import 'package:kapil11/widgets/slider_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeClass extends StatefulWidget {
  //final json_values;

  // HomeClass({
  //   required this.json_values,
  // });

  @override
  State<HomeClass> createState() => _HomeClassState();
}

class _HomeClassState extends State<HomeClass> {
  var json_values = [];
  var user_name = "";
  @override
  void initState() {
    super.initState();
    json_values = homepageapicall("1");//widget.json_values;
    print("kepil ji");
  }

  homepageapicall(String seq_id) async {
      final response = await ApiService.home_page_api(seq_id);
      var mybody = json.decode(response.body);
      final result = mybody[0]["items"];
      print(result);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: App_drawer_class(),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 234, 234, 234),
          child: Column(
            children: [
              for (var result in json_values) ...{
                if (result["result"] == "slider") ...{
                  slider_class(json_values: result["row_dt"]),
                },
                if (result["result"] == "menu") ...{
                  Container(height: 15),
                  HomePageMenuClass(),
                },
                if (result["result"] == "divisioncategory") ...{
                  home_box_title_class(title: result["row_title"]),
                  //Divider(color: Colors.black, thickness: 2.0),
                  Container(
                      child: Home_box_class(json_values: result["row_dt"]),
                      height: 150),
                },
                if (result["result"] == "itemcategory") ...{
                  home_box_title_class(title: result["row_title"]),
                  //Divider(color: Colors.black, thickness: 2.0),
                  Container(
                      child: Home_box_class2(json_values: result["row_dt"]),
                      height: 300),
                },
              },
              Text("Welcome To Home page xx vv"),
              Image.asset(
                'assets/images/logo4.png',
                width: 100,
              ),
              Text("Welcome To Home page xx vv"),
            ],
          ),
        ),
      ),
    );
  }
}
