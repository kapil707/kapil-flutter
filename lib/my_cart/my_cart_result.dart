// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kapil11/medicine_details/medicine_details_page.dart';

class MyCartItem {
  final String itemId;
  final String itemCode;
  final int itemQuantity;
  final int itemOrderQuantity;
  final String itemImage;
  final String itemName;
  final String itemPacking;
  final String itemExpiry;
  final String itemCompany;
  final String itemScheme;
  final double itemMargin;
  final int itemFeatured;
  final double itemPrice;
  final double itemQuantityPrice;
  final String itemDateTime;
  final String itemModalNumber;

  MyCartItem({
    required this.itemId,
    required this.itemCode,
    required this.itemQuantity,
    required this.itemOrderQuantity,
    required this.itemImage,
    required this.itemName,
    required this.itemPacking,
    required this.itemExpiry,
    required this.itemCompany,
    required this.itemScheme,
    required this.itemMargin,
    required this.itemFeatured,
    required this.itemPrice,
    required this.itemQuantityPrice,
    required this.itemDateTime,
    required this.itemModalNumber,
  });

  factory MyCartItem.fromJson(Map<String, dynamic> json) {
    return MyCartItem(
      itemId: json['item_id'],
      itemCode: json['item_code'],
      itemQuantity: int.parse(json['item_quantity']),
      itemOrderQuantity: int.parse(json['item_order_quantity']),
      itemImage: json['item_image'],
      itemName: json['item_name'],
      itemPacking: json['item_packing'],
      itemExpiry: json['item_expiry'],
      itemCompany: json['item_company'],
      itemScheme: json['item_scheme'],
      itemMargin: double.parse(json['item_margin']),
      itemFeatured: int.parse(json['item_featured']),
      itemPrice: double.parse(json['item_price']),
      itemQuantityPrice: double.parse(json['item_quantity_price']),
      itemDateTime: (json['item_datetime']),
      itemModalNumber: json['item_modalnumber'],
    );
  }
}

class MyCartList extends StatelessWidget {
  final List<MyCartItem> dataList;

  MyCartList(this.dataList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              print(dataList[index].itemName);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => MedicineDetailsClass(
              //         itemCode: dataList[index].itemCode,
              //         itemName: dataList[index].itemName,
              //         itemImage: dataList[index].itemImage),
              //   ),
              // );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                // Set your desired color
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    dataList[index].itemImage,
                    height: 64, // Specify the height you want
                    width: 64, // Specify the width you want
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: 11,
                  ),
                  Container(
                    width: 300,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          dataList[index].itemName,
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          dataList[index].itemCompany,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
