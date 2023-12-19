import 'package:flutter/material.dart';

class HomePageMenuClass extends StatelessWidget {
  const HomePageMenuClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 11,
      runSpacing: 11,
      children: [
        Container(
          width: 125,
          height: 160,
          child: Column(
            children: [
              Image.network(
                "https://www.drdistributor.com/img_v51/homebtn1.png",
                width: 125.0,
                height: 125.0,
                fit: BoxFit.cover,
              ),
              Text("New order"),
            ],
          ),
        ),
        Container(
          width: 125,
          height: 160,
          child: Column(
            children: [
              Image.network(
                "https://www.drdistributor.com/img_v51/homebtn2.png",
                width: 125.0,
                height: 125.0,
                fit: BoxFit.cover,
              ),
              Text("Draft"),
            ],
          ),
        ),
        Container(
          width: 125,
          height: 160,
          child: Column(
            children: [
              Image.network(
                "https://www.drdistributor.com/img_v51/homebtn3.png",
                width: 125.0,
                height: 125.0,
                fit: BoxFit.cover,
              ),
              Text("My Order"),
            ],
          ),
        ),
        Container(
          width: 125,
          height: 160,
          child: Column(
            children: [
              Image.network(
                "https://www.drdistributor.com/img_v51/homebtn4.png",
                width: 125.0,
                height: 125.0,
                fit: BoxFit.cover,
              ),
              Text("My Invoice"),
            ],
          ),
        ),
        Container(
          width: 125,
          height: 160,
          child: Column(
            children: [
              Image.network(
                "https://www.drdistributor.com/img_v51/homebtn5.png",
                width: 125.0,
                height: 125.0,
                fit: BoxFit.cover,
              ),
              Text("Track order"),
            ],
          ),
        ),
        Container(
          width: 125,
          height: 160,
          child: Column(
            children: [
              Image.network(
                "https://www.drdistributor.com/img_v51/homebtn7.png",
                width: 125.0,
                height: 125.0,
                fit: BoxFit.cover,
              ),
              Text("Notification"),
            ],
          ),
        ),
      ],
    );
  }
}
