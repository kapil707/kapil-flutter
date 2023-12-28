import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kapil11/my_notification/my_notification_result.dart';
import 'package:kapil11/utility/api_service.dart';
import 'package:kapil11/widgets/custom_app_bar2.dart';

class MyNotificationClass extends StatefulWidget {
  const MyNotificationClass({super.key});

  @override
  State<MyNotificationClass> createState() => _MyNotificationClassState();
}

class _MyNotificationClassState extends State<MyNotificationClass> {
  late Future<List<MyNotificationItem>> _dataListFuture;
  @override
  void initState() {
    super.initState();
    _dataListFuture = MyfetchData();
  }

  Future<List<MyNotificationItem>> MyfetchData() async {
    final response = await ApiService.my_notification_api();

    if (response.statusCode == 200) {
      var mybody = json.decode(response.body);
      /*print("kapil ji");
      print(mybody);*/
      List<dynamic> data = mybody[0]["items"];
      List<MyNotificationItem> MyNotificationItems =
          data.map((item) => MyNotificationItem.fromJson(item)).toList();
      return MyNotificationItems;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(page_title: "My Notification"),
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
                List<MyNotificationItem> dataList = snapshot.data as List<MyNotificationItem>;
                return Container(
                    height: MediaQuery.of(context).size.height - 150,
                    child: MyNotificationList(dataList));
              }
            },
          ),
        ],
      ),
    );
  }
}
