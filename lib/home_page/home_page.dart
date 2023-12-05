import 'package:flutter/material.dart';
import 'package:kapil11/home_page/home_box_style.dart';
import 'package:kapil11/widgets/slider/slider_widgets.dart';

class Home_page_class extends StatefulWidget {
  final json_values;

  Home_page_class({
    required this.json_values,
  });

  @override
  State<Home_page_class> createState() => _Home_page_classState();
}

class _Home_page_classState extends State<Home_page_class> {
  var json_values;
  @override
  void initState() {
    super.initState();
    json_values = widget.json_values;
    //print("kepil ji");
  }

  // List dataMapArray = [
  //   {
  //     "title": "Item 11",
  //     "subtitle": "Subtitle 1",
  //     "image_path":
  //         "https://www.drdweb.co.in/uploads/manage_slider/photo/main/volini1.jpg"
  //   },
  //   {
  //     "title": "Item 22",
  //     "subtitle": "Subtitle 2",
  //     "image_path":
  //         "https://www.drdweb.co.in/uploads/manage_slider/photo/main/volini1.jpg"
  //   },
  //   {
  //     "title": "Item 33",
  //     "subtitle": "Subtitle 3",
  //     "image_path":
  //         "https://www.drdweb.co.in/uploads/manage_slider/photo/main/volini1.jpg"
  //   }
  // ];

  // List dataMapArray1 = [
  //   {
  //     "title": "Item 111",
  //     "subtitle": "Subtitle 1",
  //     "image_path":
  //         "https://www.drdweb.co.in/uploads/manage_slider/photo/main/volini1.jpg"
  //   },
  //   {
  //     "title": "Item 222",
  //     "subtitle": "Subtitle 2",
  //     "image_path":
  //         "https://www.drdweb.co.in/uploads/manage_slider/photo/main/volini1.jpg"
  //   },
  //   {
  //     "title": "Item 333",
  //     "subtitle": "Subtitle 3",
  //     "image_path":
  //         "https://www.drdweb.co.in/uploads/manage_slider/photo/main/volini1.jpg"
  //   }
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        color: const Color.fromARGB(255, 234, 234, 234),
        child: Column(
          children: [
            for (var result in json_values) ...{
              if (result["result"] == "slider") ...{
                slider_class(json_values: result["row_dt"]),
              },
              if (result["result"] == "divisioncategory") ...{
                Container(
                    child: Home_box_class(
                      json_values: result["row_dt"],
                    ),
                    height: 150),
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
    );
  }
}
