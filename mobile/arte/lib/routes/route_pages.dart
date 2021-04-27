

import 'package:arte/routes/route_names.dart';
import 'package:arte/views/0-SplashScreen.dart';
import 'package:arte/views/1-Onboarding.dart';
import 'package:arte/views/2-SignIn.dart';
import 'package:arte/views/3-SignUp.dart';
import 'package:arte/views/4-HomeDash.dart';
import 'package:get/get.dart';

class NameRoute{

  NameRoute._();
  static final routes = 
  [
    GetPage(name: splash_startscreen , page: ()=> SplashScreen()),
    GetPage(name: onBoard , page: ()=> Onboarding()),
    GetPage(name: signin , page: ()=> SignInView()),
    GetPage(name: singup , page: ()=> SignUpView()),
    GetPage(name: homee , page: ()=> HomeDashView()),
  ];

}