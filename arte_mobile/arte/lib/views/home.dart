import 'package:arte/constants/color.dart';
import 'package:arte/controllers/homeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDashView extends StatelessWidget {

  final homedash = Get.put(HomeDashController());

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: decent_white,
        body: WillPopScope(
          onWillPop: () async => false,
          child: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Text(homedash.tokenview != null ? homedash.tokenview : "no data found"),
                ],
              ),
            ),
          ),
        ),
    );
  }


  
}