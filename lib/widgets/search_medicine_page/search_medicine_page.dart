import 'package:flutter/material.dart';
import 'package:kapil11/widgets/custom_app_bar2.dart';
import 'package:kapil11/widgets/inputs_desions.dart';
import 'package:kapil11/widgets/search_medicine_page/search_medicine_model.dart';
import 'package:kapil11/widgets/search_medicine_page/search_medicine_result.dart';

class search_medicine_class extends StatefulWidget {
  @override
  State<search_medicine_class> createState() => _search_medicine_classState();
}

class _search_medicine_classState extends State<search_medicine_class> {
  var username = TextEditingController();
  String textFieldValue = '';
  var apiResponse = '';
  // Callback function to be called when the TextField value changes
  void onTextFieldChanged(String value) {
    setState(() async {
      textFieldValue = value;
      apiResponse = await search_medicine_model.api_call(textFieldValue);
      print(apiResponse);
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
              myhintText: "Enter UserName....",
              myprefixIcon: Icon(Icons.search),
            ),
          ),
          Text("hello g"),
          search_medicine_result_class(json_values: apiResponse),
        ],
      ),
    );
  }
}
