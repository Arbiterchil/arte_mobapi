import 'dart:async';

import 'package:arte/routes/names.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{


    @override
      void onInit() {
        // TODO: implement onInit
        startTime();
        super.onInit();
      }

  startTime() {
    var duration = Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Get.toNamed(onBoard);
  }
}