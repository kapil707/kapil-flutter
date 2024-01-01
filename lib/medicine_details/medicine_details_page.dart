// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kapil11/medicine_details/medicine_details_result.dart';
import 'package:kapil11/uitheme/style.dart';
import 'package:kapil11/utility/api_service.dart';

import 'package:kapil11/widgets/custom_app_bar2.dart';

import '../widgets/inputs_desions.dart';

class MedicineDetailsClass extends StatefulWidget {
  final String itemCode;
  final String itemImage;
  final String itemName;
  final String itemPacking;
  final String itemExpiry;
  final String itemCompany;
  final String itemQuantity;
  final String itemStock;
  final String itemPtr;
  final String itemMrp;
  final String itemPrice;
  final String itemScheme;
  final String itemMargin;
  final String itemFeatured;
  final String itemDescription;

  const MedicineDetailsClass({
    required this.itemCode,
    required this.itemImage,
    required this.itemName,
    required this.itemPacking,
    required this.itemExpiry,
    required this.itemCompany,
    required this.itemQuantity,
    required this.itemStock,
    required this.itemPtr,
    required this.itemMrp,
    required this.itemPrice,
    required this.itemScheme,
    required this.itemMargin,
    required this.itemFeatured,
    required this.itemDescription,
  });

  @override
  State<MedicineDetailsClass> createState() => _MedicineDetailsClassState();
}

class _MedicineDetailsClassState extends State<MedicineDetailsClass> {
  var order_qty = TextEditingController();

  var itemCode;
  var itemImage;
  var itemName;
  var itemPacking;
  var itemExpiry;
  var itemCompany;
  var itemQuantity;
  var itemStock;
  var itemPtr;
  var itemMrp;
  var itemPrice;
  var itemScheme;
  var itemMargin;
  var itemFeatured;
  var itemDescription;

  @override
  void initState() {
    super.initState();
    itemCode = widget.itemCode;
    itemImage = widget.itemImage;
    itemName = widget.itemName;
    itemPacking = widget.itemPacking;
    itemExpiry = widget.itemExpiry;
    itemCompany = widget.itemCompany;
    itemQuantity = widget.itemQuantity;
    itemStock = widget.itemStock;
    itemPtr = widget.itemPtr;
    itemMrp = widget.itemMrp;
    itemPrice = widget.itemPrice;
    itemScheme = widget.itemScheme;
    itemMargin = widget.itemMargin;
    itemFeatured = widget.itemFeatured;
    itemDescription = widget.itemDescription;
    print("kepil ji");
    fetchMedicineData(itemCode);
    print("kepil ji end");
  }

  fetchMedicineData(_itemCode) async {
    final response = await ApiService.medicine_details_api(_itemCode);
    if (response.statusCode == 200) {
      var mybody = json.decode(response.body);
      var dt = mybody["items"];
      print(mybody);
      setState(() {
        itemPacking = dt[0]["item_packing"].toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar2(page_title: "Medicine Details", page_title2: itemCode),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 90,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child:
                  // Main content
                  Container(
                // Adjust this height based on your main content
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Image.network(
                          itemImage,
                          height: 300, // Specify the height you want
                          width: 300, // Specify the width you want
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Center(
                      child: Wrap(
                          direction: Axis.horizontal,
                          spacing: 11,
                          runSpacing: 11,
                          children: [
                            Image.network(
                              itemImage,
                              height: 82, // Specify the height you want
                              width: 82, // Specify the width you want
                              fit: BoxFit.cover,
                            ),
                            Image.network(
                              itemImage,
                              height: 82, // Specify the height you want
                              width: 82, // Specify the width you want
                              fit: BoxFit.cover,
                            ),
                            Image.network(
                              itemImage,
                              height: 82, // Specify the height you want
                              width: 82, // Specify the width you want
                              fit: BoxFit.cover,
                            ),
                            Image.network(
                              itemImage,
                              height: 82, // Specify the height you want
                              width: 82, // Specify the width you want
                              fit: BoxFit.cover,
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(itemName,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25)),
                          Text(itemPacking,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25)),
                          Text(itemName,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25)),
                          Text(itemName,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25)),
                          Text(itemName,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25)),
                          Text(itemName,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25)),
                          Text(itemName,
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 152, 144, 144),
                                  fontSize: 25)),
                          Text(itemName,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25)),
                          Text(itemName,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25)),
                          Text(itemName,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25)),
                          Text(itemName,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25)),
                          Text(itemName,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25)),
                          Container(
                            height: 100,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
