// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:not_ification/controller/main_controller.dart';
import 'package:not_ification/logic/notification_service.dart';
import 'package:get/get.dart';
import 'package:not_ification/theme.dart';
import 'package:not_ification/widget/carousel_widget/carousel_one.dart';
import 'package:not_ification/widget/carousel_widget/carousel_two.dart';
import 'package:not_ification/widget/carousel_widget/carousel_three.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:not_ification/widget/homepage_widget/help_button_widget.dart';
import 'package:not_ification/widget/homepage_widget/input_message_widget.dart';
import 'package:not_ification/widget/homepage_widget/input_name_widget.dart';
import 'package:not_ification/widget/homepage_widget/live_view_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BannerAd banner = BannerAd(
    // adUnitId: "ca-app-pub-2026236094667216/5966808901",
    adUnitId:
        "ca-app-pub-3940256099942544/6300978111", //ini yg test nanti diganti
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );

  final BannerAdListener listener = BannerAdListener(
    // Called when an ad is successfully received.
    onAdLoaded: (Ad ad) => print('Ad loaded.'),
    // Called when an ad request failed.
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      // Dispose the ad here to free resources.
      ad.dispose();
      print('Ad failed to load: $error');
    },
    // Called when an ad opens an overlay that covers the screen.
    onAdOpened: (Ad ad) => print('Ad opened.'),
    // Called when an ad removes an overlay that covers the screen.
    onAdClosed: (Ad ad) => print('Ad closed.'),
    // Called when an impression occurs on the ad.
    onAdImpression: (Ad ad) => print('Ad impression.'),
  );

  bool colorMode = false;

  TextEditingController textControllerNama = TextEditingController();
  TextEditingController textControllerPesan = TextEditingController();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    banner.load();
  }

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
      AlertDialog alert = AlertDialog(
        backgroundColor:
            mainController.colorSwitchMode == false ? bgColor : darkFieldColor,
        title: Text(
          "Fill the Name and Message please",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: mainController.colorSwitchMode == false
                ? textColor
                : darkTextColor,
          ),
        ),
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    showDialogAlertPesan(context) {
      AlertDialog alert = AlertDialog(
        backgroundColor:
            mainController.colorSwitchMode == false ? bgColor : darkFieldColor,
        title: Text(
          "Fill the Message please",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: mainController.colorSwitchMode == false
                ? textColor
                : darkTextColor,
          ),
        ),
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    showDialogAlertNama(context) {
      AlertDialog alert = AlertDialog(
        backgroundColor:
            mainController.colorSwitchMode == false ? bgColor : darkFieldColor,
        title: Text(
          "Fill the Name please",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: mainController.colorSwitchMode == false
                ? textColor
                : darkTextColor,
          ),
        ),
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    return Scaffold(
      backgroundColor:
          mainController.colorSwitchMode == false ? bgColor : darkBgColor,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, 1),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              // color: mainController.colorSwitchMode == false
              //     ? fieldColor
              //     : darkFieldColor,
              color: Colors.transparent,
              child: Center(
                child: AdWidget(ad: banner),
              ),
            ),
          ),
          // HELP BUTTON
          Align(
            alignment: Alignment(1, -1),
            child: Container(
              margin: EdgeInsets.only(top: 50, right: 20),
              child: WidgetHelpButton(),
            ),
          ),
          // CHANGE COLOR MODE BUTTON
          Align(
            alignment: Alignment(-1, -1),
            child: Container(
              margin: EdgeInsets.only(top: 50, left: 20),
              child: GestureDetector(
                onTap: () {
                  setState(
                    () {
                      colorMode = !colorMode;
                      mainController.colorSwitchMode = colorMode;
                    },
                  );
                },
                child: Icon(
                  colorMode == true ? Icons.dark_mode : Icons.light_mode,
                  size: 30,
                  color: colorMode == true ? darkFieldColor : fieldColor,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //LIVE DEMO VIEW
                WidgetLiveView(mainController: mainController),

                SizedBox(height: 50),
                // Input Name
                WidgetInputName(
                  textControllerNama: textControllerNama,
                  mainController: mainController,
                ),
                // Input Name
                WidgetInputMessage(
                  textControllerPesan: textControllerPesan,
                  mainController: mainController,
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
                              color: mainController.colorSwitchMode == false
                                  ? textColor
                                  : darkFieldColor,
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
                              color: mainController.colorSwitchMode == false
                                  ? textColor
                                  : darkFieldColor,
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
                              color: mainController.colorSwitchMode == false
                                  ? textColor
                                  : darkFieldColor,
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
                      color: mainController.colorSwitchMode == false
                          ? fieldColor
                          : darkFieldColor,
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    child: Center(
                      child: Text(
                        "SEND",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: mainController.colorSwitchMode == false
                              ? textColor
                              : darkTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
