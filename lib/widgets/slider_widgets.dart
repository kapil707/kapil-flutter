import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class slider_class extends StatefulWidget {
  final json_values;

  slider_class({
    required this.json_values,
  });

  @override
  State<slider_class> createState() => _slider_classState();
}

class _slider_classState extends State<slider_class> {
  // List imageList = [
  //   {
  //     "id": "1",
  //     "image_path":
  //         "https://www.drdweb.co.in/uploads/manage_slider/photo/main/volini1.jpg"
  //   },
  //   {
  //     "id": "2",
  //     "image_path":
  //         "https://www.drdweb.co.in/uploads/manage_slider/photo/main/volini1.jpg"
  //   }
  // ];

  late List imageList;
  //var json_values;
  @override
  void initState() {
    super.initState();
    imageList = widget.json_values;
    //print("kepil ji");
  }

  final CarouselController carouselController = CarouselController();
  int curindex = 0;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imageList
          .map((item) => Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(item["image"]),
                    fit: BoxFit.cover,
                  ),
                ),
              ))
          .toList(),
      carouselController: carouselController,

      //Slider Container properties
      options: CarouselOptions(
        height: 180.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
    );
  }
}
