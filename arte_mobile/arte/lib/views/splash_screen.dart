import 'package:arte/constants/color.dart';
import 'package:arte/constants/images.dart';
import 'package:arte/controllers/splashController.dart';
import 'package:arte/widgets/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  final splash = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    SizeXGet().init(context);
     return Scaffold(
      backgroundColor: decent_white,
      body: WillPopScope(
        onWillPop: () async => false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Align(
                   alignment: Alignment.center,
                   child:  Image.asset(
                    inlogo_splash,
                    width: 300,
                    height: 300,
                  ),
                 ),
                ],
              ),
        ),     
    );
  }
}