// // ignore_for_file: prefer_const_constructors

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:not_ification/controller/main_controller.dart';
// import 'package:get/get.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
// import 'package:flutter_native_timezone/flutter_native_timezone.dart';

// class NotificationService {
//   MainController mainController = Get.put(MainController());
//   static final NotificationService _notificationService =
//       NotificationService._internal();

//   factory NotificationService() {
//     return _notificationService;
//   }

//   NotificationService._internal();

//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   Future<void> init() async {
//     final AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('app_icon');

//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//     );

//     tz.initializeTimeZones();

//     final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();

//     tz.setLocalLocation(tz.getLocation(timeZoneName!));

//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onSelectNotification: (payload) async => selectNotification("payload"),
//     );
//   }

//   Future selectNotification(String payload) async {
//     //Handle notification tapped logic here
//     const AndroidNotificationDetails androidPlatformSpecifics =
//         AndroidNotificationDetails(
//       "Channel ID",
//       "Channel Name",
//       channelDescription: "Description",
//       importance: Importance.low,
//       icon: 'app_icon',
//     );

//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       0,
//       mainController.namaPengirim,
//       mainController.isiPesan,
//       tz.TZDateTime.now(tz.local)
//           .add(Duration(seconds: mainController.waktuDelay!)),
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           "channelId",
//           "channelName",
//           channelDescription: "Description channel",
//         ),
//       ),
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//     );

//     const NotificationDetails platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformSpecifics,
//     );

//     // await flutterLocalNotificationsPlugin.show(
//     //   1, //id
//     //   mainController.namaPengirim, //title
//     //   mainController.isiPesan, //body
//     //   platformChannelSpecifics,
//     //   payload: "ini Payload diisi data nanti", //payload
//     // );
//   }
// }
