import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kapil11/my_cart/my_cart_result.dart';
import 'package:kapil11/utility/api_service.dart';
import 'package:kapil11/widgets/custom_app_bar2.dart';

class MyCartClass extends StatefulWidget {
  const MyCartClass({super.key});

  @override
  State<MyCartClass> createState() => _MyCartClassState();
}

class _MyCartClassState extends State<MyCartClass> {
  late Future<List<MyCartItem>> _dataListFuture;
  @override
  void initState() {
    super.initState();
    _dataListFuture = fetchMedicineData();
  }

  Future<List<MyCartItem>> fetchMedicineData() async {
    final response = await ApiService.my_cart_api();

    if (response.statusCode == 200) {
      var mybody = json.decode(response.body);
      List<dynamic> data = mybody[0]["items"];
      List<MyCartItem> MyCartItems =
          data.map((item) => MyCartItem.fromJson(item)).toList();
      return MyCartItems;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(page_title: "Search Medicine"),
      body: Column(
        children: [
          Text("Result found"),
          FutureBuilder(
            future: _dataListFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                List<MyCartItem> dataList = snapshot.data as List<MyCartItem>;
                return MyCartList(dataList);
              }
            },
          ),
        ],
      ),
    );
  }
}
