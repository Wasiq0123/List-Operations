import 'package:get/get.dart';

class CounterControoler extends GetxController {
//---------Getx Follwed by Make sure variavble are abservble ----------//
  var counter = 0.obs;

  void icrement() {
    counter++;
  }
}
