// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:not_ification/controller/main_controller.dart';
import 'dart:math' as math;

import 'package:not_ification/theme.dart';

class CallingPage extends StatefulWidget {
  const CallingPage({Key? key}) : super(key: key);

  @override
  _CallingPageState createState() => _CallingPageState();
}

class _CallingPageState extends State<CallingPage> {
  bool isMicSelected = true;
  bool isCameraSelected = false;
  bool isSpeakerSelected = false;

  // BUAT TIMER
  Timer? timer;
  int seconds = 0;
  int minutes = 0;
  int hours = 0;
  //
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    // ignore: unnecessary_new
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          if (seconds < 0) {
            timer.cancel();
          } else {
            seconds = seconds + 1;
            if (seconds > 59) {
              minutes += 1;
              seconds = 0;
              if (minutes > 59) {
                hours += 1;
                minutes = 0;
              }
            }
          }
        });
      },
    );
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());
    return Scaffold(
      backgroundColor: Color(0xff36474F),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(top: 37),
            height: MediaQuery.of(context).size.height * 130 / 640,
            width: MediaQuery.of(context).size.width,
            color: darkFieldColor,
            // color: Color(0xff00786C),
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
                    "$hours:$minutes:$seconds",
                    style: TextStyle(
                      letterSpacing: 2,
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
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.dstATop),
                      image: AssetImage('assets/wa_bg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0.8),
                  child: GestureDetector(
                    // CLOSE THE APP
                    onTap: () {
                      exit(0);
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.red[600],
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Transform.rotate(
                          angle: math.pi / 36 * 27,
                          child: Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 77 / 640,
            width: MediaQuery.of(context).size.width,
            // color: Color(0xff00786C),
            color: darkFieldColor,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSpeakerSelected = !isSpeakerSelected;
                      });
                    },
                    child: AnimatedContainer(
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 200),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSpeakerSelected
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
                        isCameraSelected = !isCameraSelected;
                      });
                    },
                    child: AnimatedContainer(
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 200),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isCameraSelected == true
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
                        isMicSelected = !isMicSelected;
                      });
                    },
                    child: AnimatedContainer(
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 200),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: isMicSelected == true
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
