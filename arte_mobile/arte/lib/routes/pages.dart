import 'package:arte/routes/names.dart';
import 'package:arte/views/home.dart';
import 'package:arte/views/onboarding.dart';
import 'package:arte/views/signin.dart';
import 'package:arte/views/signup.dart';
import 'package:arte/views/splash_screen.dart';
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