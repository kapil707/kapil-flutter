// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:kapil11/widgets/custom_app_bar2.dart';

class MedicineDetailsClass extends StatefulWidget {
  final String itemName;
  final String itemImage;

  const MedicineDetailsClass({
    required this.itemName,
    required this.itemImage,
  });

  @override
  State<MedicineDetailsClass> createState() => _MedicineDetailsClassState();
}

class _MedicineDetailsClassState extends State<MedicineDetailsClass> {
  var itemName;
  var itemImage;
  @override
  void initState() {
    super.initState();
    itemName = widget.itemName;
    itemImage = widget.itemImage;
    //print("kepil ji");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar2(page_title: "Medicine Details"),
        body: Container(
          child: Column(
            children: [
              Image.network(
                itemImage,
                height: 64, // Specify the height you want
                width: 64, // Specify the width you want
                fit: BoxFit.cover,
              ),
              Text(itemName),
            ],
          ),
        ));
  }
}
