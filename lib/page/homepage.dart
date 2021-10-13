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
    MainController mainController = Get.put(MainController());
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Row(
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
            ),
            Container(
              child: Row(
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () async {
                  mainController.namaPengirim = textControllerNama.text;
                  mainController.isiPesan = textControllerPesan.text;
                  NotificationService()
                      .selectNotification(textControllerNama.text);
                  textControllerNama.clear();
                  textControllerPesan.clear();
                },
                child: Text("show"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
