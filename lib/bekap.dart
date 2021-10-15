import 'package:flutter/material.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: "input please",
            ),
          ),
        ],
      ),
    );
  }
}
