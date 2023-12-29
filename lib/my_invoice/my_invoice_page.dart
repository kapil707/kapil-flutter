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
  late ScrollController _scrollController;
  bool _isLoading = false;
  List<MyInvoiceItem> _dataList = [];

  int get_record = 0;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _dataListFuture = MyfetchData(get_record);
    _scrollController.addListener(_scrollListener);
  }

    void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
          _loadMoreData();
      // User has scrolled to the end, load more data
      // if (!_isLoading) {
      //   _loadMoreData();
      // }
    }
  }


  Future<List<MyInvoiceItem>> MyfetchData(get_record) async {
    final response = await ApiService.my_invoice_api(get_record);

    if (response.statusCode == 200) {
      var mybody = json.decode(response.body);
      print("kapil ji");
      print(mybody);
      List<dynamic> data = mybody[0]["items"];
      List<MyInvoiceItem> MyInvoiceItems =
          data.map((item) => MyInvoiceItem.fromJson(item)).toList();
      return MyInvoiceItems;
    } else {
      throw Exception('Failed to load data');
    }
  }


    void _loadMoreData() async {
    setState(() {
      _isLoading = true;
      get_record = get_record + 12;
      print(get_record);
    });

    // Simulate a delay for fetching more data
    await Future.delayed(Duration(seconds: 2));

    MyfetchMoreData(get_record);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void MyfetchMoreData(get_record) async {
    final response = await ApiService.my_invoice_api(get_record);

    if (response.statusCode == 200) {
      var mybody = json.decode(response.body);
      // print("kapil ji");
      // print(mybody);
      List<dynamic> data = mybody[0]["items"];
      List<MyInvoiceItem> MyInvoiceItems =
          data.map((item) => MyInvoiceItem.fromJson(item)).toList();
      //return MyInvoiceItems;

      setState(() {
        _dataList.addAll(MyInvoiceItems);
        _isLoading = false;
      });
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
                _dataList = snapshot.data as List<MyInvoiceItem>;
                return Container(
                    height: MediaQuery.of(context).size.height - 150,
                    child: MyInvoiceList(_dataList,_scrollController,_isLoading));
              }
            },
          ),
        ],
      ),
    );
  }
}
