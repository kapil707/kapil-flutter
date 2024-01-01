// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kapil11/uitheme/style.dart';
import 'package:kapil11/utility/api_service.dart';

import 'package:kapil11/widgets/custom_app_bar2.dart';

import '../widgets/inputs_desions.dart';

class MedicineDetailsClass extends StatefulWidget {
  final String itemCode;
  final String itemName;
  final String itemImage;

  const MedicineDetailsClass({
    required this.itemCode,
    required this.itemName,
    required this.itemImage,
  });

  @override
  State<MedicineDetailsClass> createState() => _MedicineDetailsClassState();
}

class _MedicineDetailsClassState extends State<MedicineDetailsClass> {
  var order_qty = TextEditingController();

  var itemCode;
  var itemName;
  var itemImage;

  @override
  void initState() {
    super.initState();
    itemCode = widget.itemCode;
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
            height: MediaQuery.of(context).size.height - 100,
            width: MediaQuery.of(context).size.width,
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
                Text(itemName,style: TextStyle(color: Colors.black, fontSize: 25)),
              ],
            ),
          ),
          // Footer
          Positioned(
            bottom: 0,
            left: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
              color: Colors.amberAccent,
              borderRadius: BorderRadius.circular(20.0),
            ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Order Quantity',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              alignment: Alignment.topLeft,
                              width: 100,
                              height: 50,
                              child: AddToCartInputBox(
                                mytextController: order_qty,
                                myhintText: "Enter Qty",
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Mybutton(
                              btnName: "Add To Cart",
                              btnStyle: mTextStyle11(),
                              callBack: () async {
                                String _item_order_quantity =
                                    order_qty.text.toString();
                                final response =
                                    await ApiService.medicine_add_to_cart_api(
                                        _item_order_quantity, itemCode);
                                var body = response.body;
                                var json = jsonDecode(body);
                                //print(bb);
                                var dt = json["items"];
                                print(dt[0]["status"]);
                                if (dt[0]["status"] == "1") {
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
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
