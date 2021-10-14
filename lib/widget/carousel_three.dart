// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:not_ification/controller/main_controller.dart';

class CarouselThree extends StatefulWidget {
  const CarouselThree({Key? key}) : super(key: key);

  @override
  _CarouselThreeState createState() => _CarouselThreeState();
}

class _CarouselThreeState extends State<CarouselThree> {
  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());

    List waktuJam = [
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20,
      21,
      22,
      23,
      24,
    ];
    return CarouselSlider.builder(
      itemCount: waktuJam.length,
      options: CarouselOptions(
        height: 50,
        aspectRatio: 1 / 1,
        scrollDirection: Axis.vertical,
        autoPlay: false,
        enlargeCenterPage: true,
        initialPage: 0,
        onPageChanged: (index, reason) {
          setState(
            () {
              mainController.delayJam = index;
              print(mainController.delayJam.toString());
            },
          );
        },
      ),
      itemBuilder: (context, index, indeksLagi) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              waktuJam[index].toString(),
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
