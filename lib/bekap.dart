import 'package:flutter/material.dart';
import 'package:not_ification/logic/notification_service.dart';

class TesTextField extends StatefulWidget {
  const TesTextField({Key? key}) : super(key: key);

  @override
  State<TesTextField> createState() => _TesTextFieldState();
}

class _TesTextFieldState extends State<TesTextField> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                // NotificationService().instantNotification();
              },
              child: Text("instant"),
            ),
            ElevatedButton(
              onPressed: () {
                // NotificationService().imageNotification();
              },
              child: Text("image"),
            ),
            ElevatedButton(
              onPressed: () {
                // NotificationService().stylishNotification();
              },
              child: Text("stylish"),
            ),
            ElevatedButton(
              onPressed: () {
                // NotificationService().cancelNotification();
              },
              child: Text("cancel"),
            ),
          ],
        ),
      ),
    );
  }
}
