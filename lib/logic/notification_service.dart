// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:not_ification/controller/main_controller.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  MainController mainController = Get.put(MainController());

  // INITIALISATION
  Future initialize() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    // Setting for android
    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("ic_launcher");

    final InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // Instant Notification
  Future instantNotification() async {
    var android = AndroidNotificationDetails(
      "id",
      "channel",
      channelDescription: "description",
    );

    var platform = NotificationDetails(android: android);

    await flutterLocalNotificationsPlugin.show(
      1,
      mainController.namaPengirim,
      mainController.isiPesan,
      platform,
      payload: "Wecome to demo App, Instant Message Section",
    );
  }

  // Image Notification
  Future imageNotification() async {
    var bigPicture = BigPictureStyleInformation(
      DrawableResourceAndroidBitmap("app_icon"),
      largeIcon: DrawableResourceAndroidBitmap("app_icon"),
      contentTitle: "Demo Image Notification",
      summaryText: "This is Summary Text",
      htmlFormatContent: true,
      htmlFormatContentTitle: true,
    );

    var android = AndroidNotificationDetails(
      "id",
      "channel",
      channelDescription: "description",
      styleInformation: bigPicture,
    );

    var platform = NotificationDetails(android: android);

    await flutterLocalNotificationsPlugin.show(
      1,
      mainController.namaPengirim,
      mainController.isiPesan,
      platform,
      payload: "Wecome to demo App, Image Message Section",
    );
  }

  // Stylish Notification
  Future stylishNotification() async {
    var android = AndroidNotificationDetails(
      "id",
      "channel",
      channelDescription: "description",
      color: Colors.green[700],
      enableLights: true,
      largeIcon: DrawableResourceAndroidBitmap("app_icon"),
      styleInformation: MediaStyleInformation(
        htmlFormatContent: true,
        htmlFormatTitle: true,
      ),
    );

    var platform = NotificationDetails(android: android);

    await flutterLocalNotificationsPlugin.show(
      2,
      mainController.namaPengirim,
      mainController.isiPesan,
      platform,
      payload: "Wecome to demo App, Stylish Message Section",
    );
  }

  // Scheduled Notification
  Future scheduledNotification() async {
    // TimeZone Configuration
    tz.initializeTimeZones();
    final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName!));

    var android = AndroidNotificationDetails(
      "id",
      "channel",
      channelDescription: "description",
    );

    var platform = NotificationDetails(android: android);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      3,
      mainController.namaPengirim,
      mainController.isiPesan,
      tz.TZDateTime.now(tz.local).add(
        Duration(
          seconds: mainController.delayDetik!,
          minutes: mainController.delayMenit!,
          hours: mainController.delayJam!,
        ),
      ),
      platform,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future showNotification() async {
    // TimeZone Configuration
    tz.initializeTimeZones();
    final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName!));

    var android = AndroidNotificationDetails(
      "id",
      "channel",
      channelDescription: "description",
    );

    var platform = NotificationDetails(android: android);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      3,
      mainController.namaPengirim,
      mainController.isiPesan,
      tz.TZDateTime.now(tz.local).add(
        Duration(seconds: mainController.delayDetik!),
      ),
      platform,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  // Cancel Notification
  Future cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
