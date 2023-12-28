// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kapil11/medicine_details/medicine_details_page.dart';

class Home_box_class2 extends StatefulWidget {
  final json_values;

  Home_box_class2({
    required this.json_values,
  });

  @override
  State<Home_box_class2> createState() => _Home_box_class2State();
}

class _Home_box_class2State extends State<Home_box_class2> {
  late List imageList;
  //var json_values;
  @override
  void initState() {
    super.initState();
    imageList = widget.json_values;
    //print("kepil ji");
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: imageList.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                //print(dataList[index].itemName);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MedicineDetailsClass(
                        itemCode: imageList[index]['item_code'],
                        itemName: imageList[index]['item_name'],
                        itemImage: imageList[index]['item_image']),
                  ),
                );
              },
              child: Container(
            width: 125,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              // Set your desired color
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    imageList[index]['item_image']!,
                    width: 115.0,
                    height: 90.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                    children: [
                      Container(
                          height: 40,
                          child: Center(child: Text(imageList[index]['item_name']!),),),
                          Container(
                          height: 20,
                          child: Center(child: Text(imageList[index]['item_margin']!+" Margin*"),),),
                          Container(
                          height: 20,
                          child: Center(child: Text("by "+imageList[index]['item_company']!),),),
                          Container(
                          height: 20,
                          child: Center(child: Text("MRP. "+imageList[index]['item_mrp']!+"/-"),),),
                          Container(
                          height: 20,
                          child: Center(child: Text("MRP. "+imageList[index]['item_ptr']!+"/-"),),),
                          Container(
                          height: 20,
                          child: Center(child: Text("MRP. "+imageList[index]['item_price']!+"/-"),),),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
