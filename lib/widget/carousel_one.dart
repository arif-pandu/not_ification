// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:not_ification/controller/main_controller.dart';

class CarouselOne extends StatefulWidget {
  const CarouselOne({Key? key}) : super(key: key);

  @override
  _CarouselOneState createState() => _CarouselOneState();
}

class _CarouselOneState extends State<CarouselOne> {
  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());
    Color fieldColor = Color(0xff91C788);
    Color textColor = Color(0xff464F41);

    List waktuDetik = [
      00,
      01,
      02,
      03,
      04,
      05,
      06,
      07,
      08,
      09,
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
      25,
      26,
      27,
      28,
      29,
      30,
      31,
      32,
      33,
      34,
      35,
      36,
      37,
      38,
      39,
      40,
      41,
      42,
      43,
      44,
      45,
      46,
      47,
      48,
      49,
      50,
      51,
      52,
      53,
      54,
      55,
      56,
      57,
      58,
      59,
    ];
    return CarouselSlider.builder(
      itemCount: waktuDetik.length,
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
              mainController.delayDetik = index;
              print(mainController.delayDetik.toString());
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
            color: fieldColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              waktuDetik[index].toString(),
              style: TextStyle(
                fontSize: 20,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
