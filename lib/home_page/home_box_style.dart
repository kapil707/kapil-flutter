// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Home_box_class extends StatefulWidget {
  final json_values;

  Home_box_class({
    required this.json_values,
  });

  @override
  State<Home_box_class> createState() => _Home_box_classState();
}

class _Home_box_classState extends State<Home_box_class> {
  late List imageList;
  //var json_values;
  @override
  void initState() {
    super.initState();
    imageList = widget.json_values;
    //print("kepil ji");
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: imageList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Text(imageList[index]['item_company']!),
                Image.network(
                  imageList[index]['item_image']!,
                  width: 50.0,
                  height: 50.0,
                  fit: BoxFit.cover,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
