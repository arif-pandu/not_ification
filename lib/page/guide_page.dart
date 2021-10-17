// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GuidePage extends StatelessWidget {
  const GuidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color bgColor = Color(0xffFEFFDE);
    Color fieldColor = Color(0xff91C788);
    Color textColor = Color(0xff464F41);
    TextStyle styleJudul = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: textColor,
    );
    TextStyle styleIsi = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: textColor,
    );
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "APP GUIDE",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
                Container(
                  // height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: fieldColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                "When You Should Use This App?",
                                textAlign: TextAlign.start,
                                style: styleJudul,
                              ),
                            ),
                            Text(
                              "When you want to leave a hangout/meeting/event but there is someone who makes you uncomfortable when you leave her/him.",
                              style: styleIsi,
                            ),
                            SizedBox(height: 7.5),
                            Text(
                              "When you are too lazy to leave your house but there are friends who invite.",
                              style: styleIsi,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                "How it Works?",
                                textAlign: TextAlign.start,
                                style: styleJudul,
                              ),
                            ),
                            Text(
                              "Just act as if there is an incoming whatsapp message from a friend or acquaintance and invite you for other activities long before the person in front of you comes.",
                              style: styleIsi,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                "Does it Work Well?",
                                textAlign: TextAlign.start,
                                style: styleJudul,
                              ),
                            ),
                            Text(
                              "Well, yes, actually depends on you.",
                              style: styleIsi,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(-1, -1),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                margin: EdgeInsets.only(top: 50, left: 10),
                decoration: BoxDecoration(
                  color: fieldColor,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.arrow_back,
                    size: 27,
                    color: textColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
