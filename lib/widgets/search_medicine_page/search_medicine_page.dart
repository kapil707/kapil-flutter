import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kapil11/utility/api_service.dart';
import 'package:kapil11/widgets/custom_app_bar2.dart';
import 'package:kapil11/widgets/inputs_desions.dart';
import 'package:kapil11/widgets/search_medicine_page/search_medicine_result.dart';
import 'package:http/http.dart' as http;

class search_medicine_class extends StatefulWidget {
  @override
  State<search_medicine_class> createState() => _search_medicine_classState();
}

class _search_medicine_classState extends State<search_medicine_class> {
  var username = TextEditingController();
  String textFieldValue = '';
  late Future<List<MedicineItem>> _dataListFuture;

  @override
  void initState() {
    super.initState();
    _dataListFuture =
        fetchMedicineData(); // Replace with your data fetching logic
  }

  Future<List<MedicineItem>> fetchMedicineData() async {
    // Implement your data fetching logic here
    // For example, you might call your API using the ApiService
    final response = await ApiService.searchMedicine(textFieldValue);

    if (response.statusCode == 200) {
      var bb = json.decode(response.body);
      List<dynamic> data = bb["items"];
      List<MedicineItem> medicineItems =
          data.map((item) => MedicineItem.fromJson(item)).toList();
      return medicineItems;
    } else {
      throw Exception('Failed to load data');
    }
  }

  void clearSearchBox() {
    setState(() {
      username.clear();
      textFieldValue = '';
      _dataListFuture = fetchMedicineData();
    });
  }

  void onTextFieldChanged(String value) {
    setState(() {
      textFieldValue = value;
      _dataListFuture = fetchMedicineData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(page_title: "Search Medicine"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextSearchField(
              myonChanged: onTextFieldChanged,
              mytextController: username,
              myhintText: "Enter Medicine Name....",
              myprefixIcon: Icon(Icons.search),
              myclearSearchBox: clearSearchBox,
            ),
          ),
          Text("Result found"),
          FutureBuilder(
            future: _dataListFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                List<MedicineItem> dataList =
                    snapshot.data as List<MedicineItem>;
                return SearchMedicineList(dataList);
              }
            },
          ),
        ],
      ),
    );
  }
}


// class _search_medicine_classState extends State<search_medicine_class> {
//   var username = TextEditingController();
//   String textFieldValue = '';
//   List<MedicineItem> dataList = [];
//   // Callback function to be called when the TextField value changes
//   void onTextFieldChanged(String value) {
//     // setState(() async {
//     //   textFieldValue = value;
//     //   apiResponse = await search_medicine_model.api_call(textFieldValue);
//     //   //print(apiResponse);
//     // });

//     setState(() async {
//       textFieldValue = value;

//       final response = await search_medicine_model.api_call(textFieldValue);

//       if (response.statusCode == 200) {
//         var bb = json.decode(response.body);
//         List<dynamic> data = bb["items"];
//         List<MedicineItem> medicineItems =
//             data.map((item) => MedicineItem.fromJson(item)).toList();
//         setState(() {
//           dataList = medicineItems;
//         });
//       } else {
//         print('Failed to load data');
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar2(page_title: "Search Medicine"),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: MyTextSearchField(
//               myonChanged: onTextFieldChanged,
//               mytextController: username,
//               myhintText: "Enter UserName....",
//               myprefixIcon: Icon(Icons.search),
//             ),
//           ),
//           Text("hello g"),
//           SearchMedicineList(dataList),
//         ],
//       ),
//     );
//   }
// }
