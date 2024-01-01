// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MedicineDetailsItems {
  String itemDateTime;
  String itemCode;
  String itemImage;
  String itemImage2;
  String itemImage3;
  String itemImage4;
  String itemName;
  String itemPacking;
  String itemExpiry;
  String itemBatchNo;
  String itemCompany;
  String itemQuantity;
  String itemStock;
  String itemPtr;
  String itemMrp;
  String itemPrice;
  String itemScheme;
  String itemMargin;
  String itemGst;
  String itemFeatured;
  String itemDiscount;
  String itemDescription1;
  String itemDescription2;
  String itemOrderQuantity;

  MedicineDetailsItems({
    required this.itemDateTime,
    required this.itemCode,
    required this.itemImage,
    required this.itemImage2,
    required this.itemImage3,
    required this.itemImage4,
    required this.itemName,
    required this.itemPacking,
    required this.itemExpiry,
    required this.itemBatchNo,
    required this.itemCompany,
    required this.itemQuantity,
    required this.itemStock,
    required this.itemPtr,
    required this.itemMrp,
    required this.itemPrice,
    required this.itemScheme,
    required this.itemMargin,
    required this.itemGst,
    required this.itemFeatured,
    required this.itemDiscount,
    required this.itemDescription1,
    required this.itemDescription2,
    required this.itemOrderQuantity,
  });

  factory MedicineDetailsItems.fromJson(Map<String, dynamic> json) {
    return MedicineDetailsItems(
      itemDateTime: json['item_date_time'],
      itemCode: json['item_code'],
      itemImage: json['item_image'],
      itemImage2: json['item_image2'],
      itemImage3: json['item_image3'],
      itemImage4: json['item_image4'],
      itemName: json['item_name'],
      itemPacking: json['item_packing'],
      itemExpiry: json['item_expiry'],
      itemBatchNo: json['item_batch_no'],
      itemCompany: json['item_company'],
      itemQuantity: json['item_quantity'],
      itemStock: json['item_stock'],
      itemPtr: json['item_ptr'],
      itemMrp: json['item_mrp'],
      itemPrice: json['item_price'],
      itemScheme: json['item_scheme'],
      itemMargin: json['item_margin'],
      itemGst: json['item_gst'],
      itemFeatured: json['item_featured'],
      itemDiscount: json['item_discount'],
      itemDescription1: json['item_description1'],
      itemDescription2: json['item_description2'],
      itemOrderQuantity: json['item_order_quantity'],
    );
  }
}