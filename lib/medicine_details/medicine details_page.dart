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
      body: Stack(
        children: [
          // Main content
          Container(
            // Adjust this height based on your main content
            height: MediaQuery
                .of(context)
                .size
                .height - 100,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    itemImage,
                    height: 300, // Specify the height you want
                    width: 300, // Specify the width you want
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        itemImage,
                        height: 60, // Specify the height you want
                        width: 60, // Specify the width you want
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        itemImage,
                        height: 60, // Specify the height you want
                        width: 60, // Specify the width you want
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        itemImage,
                        height: 60, // Specify the height you want
                        width: 60, // Specify the width you want
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        itemImage,
                        height: 60, // Specify the height you want
                        width: 60, // Specify the width you want
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),

                Text(itemName),
              ],
            ),
          ),
          // Footer
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              color: Colors.green,
              child: Center(
                child: Row(
                  children: [
                    Text(
                      'Footer',
                      style: TextStyle(color: Colors.white),
                    ),Text(
                      'Footer',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
