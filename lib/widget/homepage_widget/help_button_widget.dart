// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:not_ification/page/guide_page.dart';
import 'package:not_ification/theme.dart';

class WidgetHelpButton extends StatelessWidget {
  const WidgetHelpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(GuidePage());
      },
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: fieldColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            "?",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
