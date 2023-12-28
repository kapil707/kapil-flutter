import 'package:flutter/material.dart';
import 'package:kapil11/medicine_search/medicine_search_page.dart';
import 'package:kapil11/my_cart/my_cart_page.dart';
import 'package:kapil11/my_order/my_order_page.dart';

class HomePageMenuClass extends StatelessWidget {
  const HomePageMenuClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 11,
      runSpacing: 11,
      children: [
        InkWell(
          onTap: () {
            //print("hello g check");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MedicineSearchClass(),
              ),
            );
          },
          child: Container(
            width: 112,
            height: 160,
            child: Column(
              children: [
                Image.network(
                  "https://www.drdistributor.com/img_v51/homebtn1.png",
                  width: 112.0,
                  height: 112.0,
                  fit: BoxFit.cover,
                ),
                Text("New order"),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            //print("hello g check");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyCartClass(),
              ),
            );
          },
          child: Container(
            width: 112,
            height: 160,
            child: Column(
              children: [
                Image.network(
                  "https://www.drdistributor.com/img_v51/homebtn2.png",
                  width: 112.0,
                  height: 112.0,
                  fit: BoxFit.cover,
                ),
                Text("Draft"),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            //print("hello g check");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyOrderClass(),
              ),
            );
          },
          child: Container(
            width: 112,
            height: 160,
            child: Column(
              children: [
                Image.network(
                  "https://www.drdistributor.com/img_v51/homebtn3.png",
                  width: 112.0,
                  height: 112.0,
                  fit: BoxFit.cover,
                ),
                Text("My Order"),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            print("hello g check");
          },
          child: Container(
            width: 112,
            height: 160,
            child: Column(
              children: [
                Image.network(
                  "https://www.drdistributor.com/img_v51/homebtn4.png",
                  width: 112.0,
                  height: 112.0,
                  fit: BoxFit.cover,
                ),
                Text("My Invoice"),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            print("hello g check");
          },
          child: Container(
            width: 112,
            height: 160,
            child: Column(
              children: [
                Image.network(
                  "https://www.drdistributor.com/img_v51/homebtn5.png",
                  width: 112.0,
                  height: 112.0,
                  fit: BoxFit.cover,
                ),
                Text("Track order"),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            print("hello g check");
          },
          child: Container(
            width: 112,
            height: 160,
            child: Column(
              children: [
                Image.network(
                  "https://www.drdistributor.com/img_v51/homebtn7.png",
                  width: 112.0,
                  height: 112.0,
                  fit: BoxFit.cover,
                ),
                Text("Notification"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
