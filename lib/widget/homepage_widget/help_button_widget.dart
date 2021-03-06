// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:not_ification/page/guide_page.dart';
import 'package:not_ification/theme.dart';
import 'package:not_ification/controller/main_controller.dart';

class WidgetHelpButton extends StatelessWidget {
  const WidgetHelpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());
    return GestureDetector(
      onTap: () {
        Get.to(GuidePage());
      },
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: mainController.colorSwitchMode == false
              ? fieldColor
              : darkFieldColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            "?",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: mainController.colorSwitchMode == false
                  ? textColor
                  : darkTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
