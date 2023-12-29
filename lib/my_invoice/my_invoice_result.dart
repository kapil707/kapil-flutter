// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kapil11/medicine_details/medicine_details_page.dart';

class MyInvoiceItem {
  final String itemId;
  final String itemTitle;
  final String itemMessage;
  final String itemDateTime;
  final String itemImage;
  final String getRecord;

  MyInvoiceItem({
    required this.itemId,
    required this.itemTitle,
    required this.itemMessage,
    required this.itemDateTime,
    required this.itemImage,
    required this.getRecord,
  });

  factory MyInvoiceItem.fromJson(Map<String, dynamic> json) {
    return MyInvoiceItem(
      itemId: json['item_id'],
      itemTitle: json['item_title'],
      itemMessage: json['item_message'],
      itemDateTime: json['item_date_time'],
      itemImage: json['item_image'],
      getRecord: json['get_record'],
    );
  }
}

class MyInvoiceList extends StatelessWidget {
  final List<MyInvoiceItem> dataList;
  final ScrollController _scrollController;
  final bool _isLoading;

  MyInvoiceList(this.dataList,this._scrollController,this._isLoading);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: dataList.length + 1,
      itemBuilder: (context, index) {
        if (index == dataList.length) {
            // Loading indicator when reaching the end
            return _isLoading ?Container(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      Container(height: 11),
                      Text("Loading....")
                    ],
                  ),
                ) : Container();
          } else{
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              //print(dataList[index].itemName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MedicineDetailsClass(
                      itemCode: dataList[index].itemId,
                      itemName: dataList[index].itemTitle,
                      itemImage: dataList[index].itemImage),
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
                          dataList[index].itemTitle,
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          dataList[index].itemMessage,
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
          }
      },
    );
  }
}
