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
    _dataListFuture = MyfetchData();
  }

  Future<List<MyCartItem>> MyfetchData() async {
    final response = await ApiService.my_cart_api();

    if (response.statusCode == 200) {
      var mybody = json.decode(response.body);
      print(mybody[0]["items"]);
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
      appBar: CustomAppBar2(page_title: "My Cart"),
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
                List<MyCartItem> dataList = snapshot.data as List<MyCartItem>;
                return Container(
                    height: MediaQuery.of(context).size.height - 150,
                    child: MyCartList(dataList));
              }
            },
          ),
        ],
      ),
    );
  }
}
