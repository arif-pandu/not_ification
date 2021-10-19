// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:not_ification/controller/main_controller.dart';
import 'package:not_ification/theme.dart';

class WidgetInputMessage extends StatelessWidget {
  const WidgetInputMessage({
    Key? key,
    required this.textControllerPesan,
    required this.mainController,
  }) : super(key: key);

  final TextEditingController textControllerPesan;
  final MainController mainController;

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextField(
          controller: textControllerPesan,
          style: TextStyle(
            fontSize: 18,
            color: mainController.colorSwitchMode == false
                ? textColor
                : darkTextColor,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: "Message",
            hintStyle: TextStyle(
              color: mainController.colorSwitchMode == false
                  ? textColor
                  : darkTextColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: mainController.colorSwitchMode == false
                ? fieldColor
                : darkFieldColor,
          ),
          onChanged: (text) {
            mainController.pesanSender = RxString(text);
          }),
    );
  }
}
