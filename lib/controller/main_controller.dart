import 'package:get/get.dart';

class MainController extends GetxController {
  String? namaPengirim;
  String? isiPesan;

  bool? pakaiTimer;

  int delayDetik = 1;
  int delayMenit = 0;
  int delayJam = 0;

  RxString namaSender = RxString("nama");
  RxString pesanSender = RxString("Ini pesannya");
}
