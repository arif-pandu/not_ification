// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:not_ification/controller/main_controller.dart';
import 'package:not_ification/logic/notification_service.dart';
import 'package:get/get.dart';
import 'package:not_ification/widget/carousel_one.dart';
import 'package:not_ification/widget/carousel_three.dart';
import 'package:not_ification/widget/carousel_two.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool timerDipakai = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController textControllerNama = TextEditingController();
    TextEditingController textControllerPesan = TextEditingController();
    TextEditingController textControllerWaktu = TextEditingController();

    MainController mainController = Get.put(MainController());

    void submitForm() {
      mainController.namaPengirim = textControllerNama.text;
      mainController.isiPesan = textControllerPesan.text;
    }

    void clearForm() {
      textControllerNama.clear();
      textControllerPesan.clear();
      textControllerWaktu.clear();
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: MediaQuery.of(context).size.width * 0.6,
              child: TextField(
                controller: textControllerNama,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.blue.shade100,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: MediaQuery.of(context).size.width * 0.6,
              child: TextField(
                controller: textControllerPesan,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: "Message",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Delayed",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                CupertinoSwitch(
                  value: timerDipakai,
                  onChanged: (value) {
                    setState(() {
                      timerDipakai = value;
                      mainController.pakaiTimer = timerDipakai;
                      print(mainController.pakaiTimer.toString());
                    });
                  },
                ),
                Text(
                  "Instant",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            Visibility(
              visible: mainController.pakaiTimer == true ? true : false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 60,
                    width: 60,
                    color: Colors.transparent,
                    child: CarouselOne(),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 60,
                    width: 60,
                    color: Colors.transparent,
                    child: CarrouselTwo(),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 60,
                    width: 60,
                    color: Colors.transparent,
                    child: CarouselThree(),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                submitForm();
                NotificationService().showNotification();
              },
              child: Container(
                margin: EdgeInsets.all(20),
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "SEND",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            // Container(
            //   margin: const EdgeInsets.all(10),
            //   padding: const EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //     border: Border.all(
            //       width: 3,
            //       color: Colors.blue,
            //     ),
            //   ),
            //   child: Column(
            //     children: [
            //       // INSTANT
            //       ElevatedButton(
            //         onPressed: () async {
            //           submitForm();
            //           NotificationService().instantNotification();
            //           clearForm();
            //         },
            //         child: Text("Instant"),
            //       ),

            //       // IMAGE
            //       ElevatedButton(
            //         onPressed: () async {
            //           submitForm();
            //           NotificationService().imageNotification();
            //           clearForm();
            //         },
            //         child: Text("Image"),
            //       ),

            //       // STYLISH
            //       ElevatedButton(
            //         onPressed: () async {
            //           submitForm();
            //           NotificationService().stylishNotification();
            //           clearForm();
            //         },
            //         child: Text("Stylish"),
            //       ),

            //       // SCHEDULED
            //       ElevatedButton(
            //         onPressed: () async {
            //           submitForm();
            //           NotificationService().scheduledNotification();
            //           clearForm();
            //         },
            //         child: Text("Scheduled"),
            //       ),

            //       // CANCEL
            //       ElevatedButton(
            //         onPressed: () async {
            //           NotificationService().cancelNotification();
            //         },
            //         child: Text("Cancel"),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
