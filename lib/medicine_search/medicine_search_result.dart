// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kapil11/medicine_details/medicine_details_page.dart';

class MedicineItem {
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
  final String similarItems;
  final String count;
  final String getRecord;

  MedicineItem({
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
    required this.similarItems,
    required this.count,
    required this.getRecord,
  });

  factory MedicineItem.fromJson(Map<String, dynamic> json) {
    return MedicineItem(
      itemCode: json['item_code'],
      itemImage: json['item_image'],
      itemName: json['item_name'],
      itemPacking: json['item_packing'],
      itemExpiry: json['item_expiry'],
      itemCompany: json['item_company'],
      itemQuantity: json['item_quantity'],
      itemStock: json['item_stock'],
      itemPtr: json['item_ptr'],
      itemMrp: json['item_mrp'],
      itemPrice: json['item_price'],
      itemScheme: json['item_scheme'],
      itemMargin: json['item_margin'],
      itemFeatured: json['item_featured'],
      itemDescription: json['item_description'],
      similarItems: json['similar_items'],
      count: json['count'],
      getRecord: json['get_record'],
    );
  }
}

class MedicineSearchList extends StatelessWidget {
  final List<MedicineItem> dataList;

  MedicineSearchList(this.dataList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              //print(dataList[index].itemName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MedicineDetailsClass(
                      itemCode: dataList[index].itemCode,
                      itemImage: dataList[index].itemImage,
                      itemName: dataList[index].itemName,
                      itemPacking: dataList[index].itemPacking,
                      itemExpiry: dataList[index].itemExpiry,
                      itemCompany: dataList[index].itemCompany,
                      itemQuantity: dataList[index].itemQuantity,
                      itemStock: dataList[index].itemStock,
                      itemPtr: dataList[index].itemPtr,
                      itemMrp: dataList[index].itemMrp,
                      itemPrice: dataList[index].itemPrice,
                      itemScheme: dataList[index].itemScheme,
                      itemMargin: dataList[index].itemMargin,
                      itemFeatured: dataList[index].itemFeatured,
                      itemDescription: dataList[index].itemDescription),
                ),
              );
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
