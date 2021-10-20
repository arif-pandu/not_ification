// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:not_ification/controller/main_controller.dart';
import 'package:get/get.dart';
import 'package:not_ification/theme.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    //
    MainController mainController = Get.put(MainController());

    DateTime timeNow = DateTime.now();

    TextEditingController _textEditingController = TextEditingController();

    //
    return Scaffold(
      body: Column(
        children: [
          // TOP TITLE
          Container(
            height: 65,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                // ICON BACK
                Container(
                  height: 20,
                  width: 20,
                  margin: EdgeInsets.only(
                    left: 8,
                    right: 9,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: darkTextColor,
                  ),
                ),
                // PROFILE PICTURE
                Container(
                  height: 41,
                  width: 41,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/wa_bg.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // SENDER NAME
                Container(
                  margin: EdgeInsets.only(left: 9),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mainController.namaPengirim!,
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Roboto",
                        ),
                      ),
                      Text(
                        "online",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto",
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.video_call_rounded, color: darkTextColor),
                      Icon(Icons.phone, color: darkTextColor),
                      Icon(Icons.more_vert, color: darkTextColor),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //
          // CHAT BALLON AREA
          Container(
            height: MediaQuery.of(context).size.height - 115,
            width: MediaQuery.of(context).size.width,
            color: darkBgColor,
          ),
          //
          // INPUT CHAT
          Row(
            children: [
              // INPUT TEXTFIELD
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 60,
                margin: EdgeInsets.only(bottom: 3),
                decoration: BoxDecoration(
                  color: darkFieldColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    hintText: "Type a message",
                    fillColor: fieldColor,
                    filled: true,
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: darkTextColor,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
