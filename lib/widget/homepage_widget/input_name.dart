// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:not_ification/controller/main_controller.dart';
import 'package:not_ification/theme.dart';

class WidgetInputName extends StatelessWidget {
  const WidgetInputName({
    Key? key,
    required this.textControllerNama,
    required this.mainController,
  }) : super(key: key);

  final TextEditingController textControllerNama;
  final MainController mainController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextField(
          controller: textControllerNama,
          style: TextStyle(
            fontSize: 18,
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: "Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: fieldColor,
          ),
          onChanged: (text) {
            mainController.namaSender = RxString(text);
          }),
    );
  }
}
