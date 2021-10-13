// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:not_ification/controller/main_controller.dart';
import 'package:not_ification/logic/notification_service.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textControllerNama = TextEditingController();
    TextEditingController textControllerPesan = TextEditingController();
    TextEditingController textControllerWaktu = TextEditingController();
    MainController mainController = Get.put(MainController());

    void submitForm() {
      mainController.namaPengirim = textControllerNama.text;
      mainController.isiPesan = textControllerPesan.text;
      mainController.waktuDelay = int.parse(textControllerWaktu.text);
    }

    void clearForm() {
      textControllerNama.clear();
      textControllerPesan.clear();
      textControllerWaktu.clear();
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Nama"),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextField(
                    controller: textControllerNama,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Pesan"),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextField(
                    controller: textControllerPesan,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Delay"),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextField(
                    controller: textControllerWaktu,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: Colors.blue,
                ),
              ),
              child: Column(
                children: [
                  // INSTANT
                  ElevatedButton(
                    onPressed: () async {
                      submitForm();
                      NotificationService().instantNotification();
                      clearForm();
                    },
                    child: Text("Instant"),
                  ),

                  // IMAGE
                  ElevatedButton(
                    onPressed: () async {
                      submitForm();
                      NotificationService().imageNotification();
                      clearForm();
                    },
                    child: Text("Image"),
                  ),

                  // STYLISH
                  ElevatedButton(
                    onPressed: () async {
                      submitForm();
                      NotificationService().stylishNotification();
                      clearForm();
                    },
                    child: Text("Stylish"),
                  ),

                  // SCHEDULED
                  ElevatedButton(
                    onPressed: () async {
                      submitForm();
                      NotificationService().scheduledNotification();
                      clearForm();
                    },
                    child: Text("Scheduled"),
                  ),

                  // CANCEL
                  ElevatedButton(
                    onPressed: () async {
                      NotificationService().cancelNotification();
                    },
                    child: Text("Cancel"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
