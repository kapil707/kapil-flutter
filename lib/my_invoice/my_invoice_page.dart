import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kapil11/my_invoice/my_invoice_result.dart';
import 'package:kapil11/utility/api_service.dart';
import 'package:kapil11/widgets/custom_app_bar2.dart';

class MyInvoiceClass extends StatefulWidget {
  const MyInvoiceClass({super.key});

  @override
  State<MyInvoiceClass> createState() => _MyInvoiceClassState();
}

class _MyInvoiceClassState extends State<MyInvoiceClass> {
  late Future<List<MyInvoiceItem>> _dataListFuture;
  @override
  void initState() {
    super.initState();
    _dataListFuture = MyfetchData();
  }

  Future<List<MyInvoiceItem>> MyfetchData() async {
    final response = await ApiService.my_invoice_api();

    if (response.statusCode == 200) {
      var mybody = json.decode(response.body);
      /*print("kapil ji");
      print(mybody);*/
      List<dynamic> data = mybody[0]["items"];
      List<MyInvoiceItem> MyInvoiceItems =
          data.map((item) => MyInvoiceItem.fromJson(item)).toList();
      return MyInvoiceItems;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(page_title: "My Invoice"),
      body: Column(
        children: [
          FutureBuilder(
            future: _dataListFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  height: MediaQuery.of(context).size.height - 150,
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
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                List<MyInvoiceItem> dataList = snapshot.data as List<MyInvoiceItem>;
                return Container(
                    height: MediaQuery.of(context).size.height - 150,
                    child: MyInvoiceList(dataList));
              }
            },
          ),
        ],
      ),
    );
  }
}
