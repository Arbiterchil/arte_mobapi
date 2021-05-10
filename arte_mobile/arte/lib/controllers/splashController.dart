import 'dart:async';

import 'package:arte/elements/shared_prefs.dart';
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
    var checkToken = Sharedprefs.getToken();
    var checkDoneViewOnboard = Sharedprefs.getDone();
    if(checkToken != null) Get.offNamedUntil(homee, (route) => false);
    else if(checkDoneViewOnboard != null) Get.offNamedUntil(signin, (route) => false); 
    else Get.toNamed(onBoard);
  }
}