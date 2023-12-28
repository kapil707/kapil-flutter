import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kapil11/my_order/my_order_result.dart';
import 'package:kapil11/utility/api_service.dart';
import 'package:kapil11/widgets/custom_app_bar2.dart';

class MyOrderClass extends StatefulWidget {
  const MyOrderClass({super.key});

  @override
  State<MyOrderClass> createState() => _MyOrderClassState();
}

class _MyOrderClassState extends State<MyOrderClass> {
  late Future<List<MyOrderItem>> _dataListFuture;
  @override
  void initState() {
    super.initState();
    _dataListFuture = MyfetchData();
  }

  Future<List<MyOrderItem>> MyfetchData() async {
    final response = await ApiService.my_order_api();

    if (response.statusCode == 200) {
      var mybody = json.decode(response.body);
      /*print("kapil ji");
      print(mybody);*/
      List<dynamic> data = mybody[0]["items"];
      List<MyOrderItem> MyOrderItems =
          data.map((item) => MyOrderItem.fromJson(item)).toList();
      return MyOrderItems;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(page_title: "My Order"),
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
                List<MyOrderItem> dataList = snapshot.data as List<MyOrderItem>;
                return Container(
                    height: MediaQuery.of(context).size.height - 150,
                    child: MyOrderList(dataList));
              }
            },
          ),
        ],
      ),
    );
  }
}
