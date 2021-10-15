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
  Color bgColor = Color(0xffFEFFDE);
  Color fieldColor = Color(0xff91C788);
  Color textColor = Color(0xff464F41);
  TextEditingController textControllerNama = TextEditingController();
  TextEditingController textControllerPesan = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());

    void submitForm() {
      mainController.namaPengirim = textControllerNama.text;
      mainController.isiPesan = textControllerPesan.text;
    }

    void clearForm() {
      textControllerNama.clear();
      textControllerPesan.clear();
    }

    showDialogAlert(context) {
      // set up the button
      Widget okButton = ElevatedButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        backgroundColor: bgColor,
        title: Text(
          "Fill the Name and Message please",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
          ),
        ),
      );
      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    showDialogAlertPesan(context) {
      // set up the button
      Widget okButton = ElevatedButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        backgroundColor: bgColor,
        title: Text(
          "Fill the Message please",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
          ),
        ),
      );
      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    showDialogAlertNama(context) {
      // set up the button
      Widget okButton = ElevatedButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        backgroundColor: bgColor,
        title: Text(
          "Fill the Name please",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
          ),
        ),
      );
      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Align(
            alignment: Alignment(1, -1),
            child: Container(
              margin: EdgeInsets.only(top: 50, right: 20),
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
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: fieldColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Container(
                            height: 40,
                            width: 40,
                            margin: EdgeInsets.only(top: 8),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Text("Nama"),
                                  Obx(
                                    () => Text(
                                      mainController.namaSender.toString(),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Obx(
                                () => Text(
                                  mainController.pesanSender.toString(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Container(
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
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextField(
                      controller: textControllerPesan,
                      style: TextStyle(
                        fontSize: 18,
                        color: textColor,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        hintText: "Message",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: fieldColor,
                      ),
                      onChanged: (text) {
                        mainController.pesanSender = RxString(text);
                      }),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "sec",
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                            height: 60,
                            width: 60,
                            color: Colors.transparent,
                            child: CarouselOne(),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "min",
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                            height: 60,
                            width: 60,
                            color: Colors.transparent,
                            child: CarrouselTwo(),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "hour",
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                            height: 60,
                            width: 60,
                            color: Colors.transparent,
                            child: CarouselThree(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    if (textControllerNama.text.isNotEmpty &&
                        textControllerPesan.text.isNotEmpty) {
                      submitForm();
                      NotificationService().showNotification();
                      clearForm();
                      print("Detik : " +
                          mainController.delayDetik.toString() +
                          " Menit : " +
                          mainController.delayMenit.toString() +
                          " Jam : " +
                          mainController.delayJam.toString());
                      setState(() {
                        mainController.namaSender = RxString("nama");
                        mainController.pesanSender = RxString("pesan");
                      });
                    } else if (textControllerNama.text.isEmpty &&
                        textControllerPesan.text.isEmpty) {
                      showDialogAlert(context);
                    } else if (textControllerNama.text.isNotEmpty &&
                        textControllerPesan.text.isEmpty) {
                      showDialogAlertPesan(context);
                    } else if (textControllerNama.text.isEmpty &&
                        textControllerPesan.text.isNotEmpty) {
                      showDialogAlertNama(context);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(20),
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: fieldColor,
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    child: Center(
                      child: Text(
                        "SEND",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: textColor,
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
        ],
      ),
    );
  }
}
