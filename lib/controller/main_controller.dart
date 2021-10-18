import 'package:get/get.dart';
import 'package:flutter_local_notifications/src/platform_specifics/android/person.dart';

class MainController extends GetxController {
  String? namaPengirim;
  String? isiPesan;

  bool? pakaiTimer;

  int delayDetik = 1;
  int delayMenit = 0;
  int delayJam = 0;

  RxString namaSender = RxString("name");
  RxString pesanSender = RxString("This will be the message");

  // Person? namaOrang = Person(
  //   bot: false,
  //   name: namaPengirim!,

  // );
}
