import 'package:flutter/material.dart';

class Home_box_class extends StatelessWidget {
  List<Map<String, String>> dataMapArray = [
    {
      "title": "Item 1",
      "subtitle": "Subtitle 1",
      "image_path":
          "https://www.drdweb.co.in/uploads/manage_slider/photo/main/volini1.jpg"
    },
    {
      "title": "Item 2",
      "subtitle": "Subtitle 2",
      "image_path":
          "https://www.drdweb.co.in/uploads/manage_slider/photo/main/volini1.jpg"
    },
    {
      "title": "Item 3",
      "subtitle": "Subtitle 3",
      "image_path":
          "https://www.drdweb.co.in/uploads/manage_slider/photo/main/volini1.jpg"
    },
    {
      "title": "Item 4",
      "subtitle": "Subtitle 4",
      "image_path":
          "https://www.drdweb.co.in/uploads/manage_slider/photo/main/volini1.jpg"
    },
    {
      "title": "Item 5",
      "subtitle": "Subtitle 5",
      "image_path":
          "https://www.drdweb.co.in/uploads/manage_slider/photo/main/volini1.jpg"
    },
    {
      "title": "Item 5",
      "subtitle": "Subtitle 5",
      "image_path":
          "https://www.drdweb.co.in/uploads/manage_slider/photo/main/volini1.jpg"
    },
    {
      "title": "Item 5",
      "subtitle": "Subtitle 5",
      "image_path":
          "https://www.drdweb.co.in/uploads/manage_slider/photo/main/volini1.jpg"
    },
    {
      "title": "Item 5",
      "subtitle": "Subtitle 5",
      "image_path":
          "https://www.drdweb.co.in/uploads/manage_slider/photo/main/volini1.jpg"
    },
    {
      "title": "Item 5",
      "subtitle": "Subtitle 5",
      "image_path":
          "https://www.drdweb.co.in/uploads/manage_slider/photo/main/volini1.jpg"
    },
    {
      "title": "Item 5",
      "subtitle": "Subtitle 5",
      "image_path":
          "https://www.drdweb.co.in/uploads/manage_slider/photo/main/volini1.jpg"
    },
    {
      "title": "Item 5",
      "subtitle": "Subtitle 5",
      "image_path":
          "https://www.drdweb.co.in/uploads/manage_slider/photo/main/volini1.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: dataMapArray.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Text(dataMapArray[index]['title']!),
                Text(dataMapArray[index]['subtitle']!),
                Image.network(
                  dataMapArray[index]['image_path']!,
                  width: 50.0,
                  height: 50.0,
                  fit: BoxFit.cover,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
