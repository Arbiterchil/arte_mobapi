import 'package:arte/constants/color.dart';
import 'package:arte/controllers/4-homedash.dart';
import 'package:arte/widgets/drawer_1/controller/collapse_animation.dart';
import 'package:arte/widgets/drawer_2/simple_and_clean.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math show pi;
class HomeDashView extends StatelessWidget {

  final homedash = Get.put(HomeDashController());

  @override
  Widget build(BuildContext context) {
    
    // return Scaffold(
    //   body: SafeArea(
    //     child: CollapsibleSidebar(
    //     items: homedash.items,
    //     // avatarImg: _avatarImg,
    //     title: 'John Smith',
    //     body: Container(),
    //     backgroundColor: not_sopure_black,
    //     selectedTextColor: light_color, 
    //     unselectedTextColor: darkish_color,
    //     unselectedIconColor: decent_background_color,
    //     selectedIconColor: light_color,
    //     selectedIconBox: colorless,
    //     iconSize: 30,
    //     screenPadding: 0,
    //     textStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
    //     titleStyle: TextStyle(
    //         fontSize: 20,
    //         fontStyle: FontStyle.italic,
    //         fontWeight: FontWeight.bold),
    //     toggleTitleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //   ),
    //   ),
    // );
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