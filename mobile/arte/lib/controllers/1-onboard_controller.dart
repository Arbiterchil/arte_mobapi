import 'package:arte/constants/images.dart';
import 'package:arte/models/onboard_model.dart';
import 'package:arte/routes/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnboardController extends GetxController{


  var selectedPagexNumber = 0.obs;
bool get isLastPage => selectedPagexNumber.value == onBoardPages.length -1;
var pageControll = PageController();

   forwardAct()
  {
    if(isLastPage) Get.offNamedUntil(signin, (route)=> false);

    else pageControll.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<Onboardslist> onBoardPages = 
  [
    Onboardslist("Welcome to Arte!",
    "Become a Solid Fan on Authors",
    "Many Author Shows their arts maybe you can find your own likings.",
    view1),
    Onboardslist("Get Notified!",
    "Notified by your favorite Author.",
    "Stay tune when you favorite author post new things.",
    view2),
    Onboardslist("Be a Fan or Judge",
    "You can be judge or become a true fan.",
    "Judge the arts? Or become fan and follow the author.",
    view3),
    Onboardslist("Or Become an Author",
    "Becoming One!",
    "Become Author and let the people or the whole world of your talents.",
    view4),
  ];

}