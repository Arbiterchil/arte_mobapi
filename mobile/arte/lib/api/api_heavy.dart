

import 'dart:convert';

import 'package:arte/api/api_points.dart';
import 'package:arte/api/api_signs.dart';
import 'package:arte/constants/color.dart';
import 'package:arte/elements/shared_pref.dart';
import 'package:arte/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiHeavy{


    signIndynamic(data){
      
      loaderUni();
      ApiSign apiSign = ApiSign(ApiArte.signIn,data);
      apiSign.postwithData().then((value) async{
        var tokenview = json.decode(value.body);
         print(tokenview['access_token']);
        var token = tokenview['access_token'];
         await Sharedprefs.usertoken(token.toString());
       
        
        
        Get.back();
        Get.offAllNamed(homee);
      }).catchError((onError){
          Get.back();
          errorUni();
      });

    }

    signUpdynamic(data) async{
      ApiSign apiSign =ApiSign(ApiArte.signUp,data);
      apiSign.postwithData().then((value){
        var viewResult = json.decode(value.body);
        print(viewResult);
      }).catchError((onError){

      });
    }
  
  errorUni(){
        Get.defaultDialog(
          backgroundColor: decent_white,
          barrierDismissible: false,
          title: "Try Again!",
          titleStyle: TextStyle(
            color: not_sopure_black,
            fontFamily: "Metropolis-Bold",
            fontSize: 18
          ),
          onConfirm: ()=> Get.back(),
          confirmTextColor: decent_white,
          buttonColor: not_sopure_black,
          content: Container(
            height: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  child: LinearProgressIndicator(
                    backgroundColor: not_sopure_black,
                    valueColor: AlwaysStoppedAnimation(darkish_color),
                  ),
                ),
                SizedBox(height: 15,),
                Text("Something went wrong!",
                style: TextStyle(
            color: not_sopure_black,
            fontFamily: "Metropolis-Regular",
            fontSize: 12
          ),
                ),
              ],
            ),
          ),
        );
    }

    loaderUni(){
     Get.dialog(
        Center(
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: decent_white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(darkish_color),
              backgroundColor: not_sopure_black),
          )
          
        ),
      ),
      barrierDismissible: false,
      barrierColor: colorless_other,
      );
    }


}