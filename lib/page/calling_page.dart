// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:not_ification/controller/main_controller.dart';

class CallingPage extends StatefulWidget {
  const CallingPage({Key? key}) : super(key: key);

  @override
  _CallingPageState createState() => _CallingPageState();
}

class _CallingPageState extends State<CallingPage> {
  bool isMicSelected = true;
  bool isCameraSelected = false;
  bool isSpeakerSelected = false;
  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());
    return Scaffold(
      backgroundColor: Color(0xff36474F),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(top: 37),
            height: MediaQuery.of(context).size.height * 130 / 640,
            width: MediaQuery.of(context).size.width,
            color: Color(0xff00786C),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Colors.white,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Colors.white,
                          size: 16,
                        ),
                        SizedBox(width: 7.5),
                        Text(
                          "WHATSARR CALLING",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.group_add_sharp,
                      color: Colors.white,
                    ),
                  ],
                ),
                Text(
                  mainController.namaPengirim!,
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(
                    "10:2:22",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height:
                MediaQuery.of(context).size.height * (1 - (1 * (207 / 640))),
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Align(
              alignment: Alignment(0, 0.8),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Icon(
                      Icons.phone,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 77 / 640,
            width: MediaQuery.of(context).size.width,
            color: Color(0xff00786C),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSpeakerSelected != isSpeakerSelected;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSpeakerSelected == true
                            ? Colors.white.withOpacity(0.2)
                            : Colors.transparent,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.music_note,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isCameraSelected != isCameraSelected;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSpeakerSelected == true
                              ? Colors.white.withOpacity(0.2)
                              : Colors.transparent,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.camera_alt_rounded,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMicSelected != isMicSelected;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: isSpeakerSelected == true
                              ? Colors.white.withOpacity(0.2)
                              : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.mic,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
