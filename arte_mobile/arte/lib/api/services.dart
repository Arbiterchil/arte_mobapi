
import 'dart:convert';

import 'package:arte/api/endpoints.dart';
import 'package:arte/constants/color.dart';
import 'package:arte/elements/shared_prefs.dart';
import 'package:arte/models/posts.dart';
import 'package:arte/models/upload_images.dart';
import 'package:arte/routes/names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class ApiServices {

  static var client = http.Client();


  static signInNow(data) async {
    loaderUni();
    var response = await client.post(Uri.parse(ApiArte.signIn),body: data,
    headers: {
      "Accepts": ContentType.accepts
    }).timeout(Duration(minutes: 2));

    if(response.statusCode == 200){
       var tokenview = json.decode(response.body);
         print(tokenview['access_token']);
        var token = tokenview['access_token'];
         await Sharedprefs.usertoken(token.toString());
         await Sharedprefs.setUsersDetails(json.encode(tokenview['user']));
        Get.back();
        Get.offAllNamed(homee);
    }else{
       Get.back();
          errorUni();
    }

  }


  static signUpNow(data) async {
    loaderUni();
   var response = await client.post(Uri.parse(ApiArte.signUp),body: data,
    headers: {
      "Accepts": ContentType.accepts
    }).timeout(Duration(minutes: 2));

    if(response.statusCode == 200){
          var viewResult = json.decode(response.body);
        print(viewResult);
         Get.back();
            Get.offAllNamed(signin);
        }else{
           Get.back();
          errorUni();
        }

  }

static  getPost() async{
    var response = await client.get(Uri.parse(ApiArte.getPostView));
    if(response.statusCode == 200){
      var data =  jsonDecode(response.body);
     
      Iterable list = data['data'];
      //  getUploadImages(data['data'][0]['id']);
      // print( list.map((e) => e).toList());
      // List trial = list.map((e) => e['upload_images']).toList();
      // print(trial.map((e) => UploadImage.fromJson(e)).toList());
      return list.map((e) => Datum.fromJson(e)).toList();
      // return postsFromJson(data);
        
    } else{
      return null;
    } 
  }

  
static  getPostUpload() async{
    var response = await client.get(Uri.parse(ApiArte.getPostView));
    if(response.statusCode == 200){
      var data =  jsonDecode(response.body);
     
      Iterable list = data['data'];
      Iterable listp = list.map((e) => e[['upload_images']]).toList();
      print(listp);
      // print(List<dynamic>.from(list.map((e) => e).map((e) => e['upload_images'])).toList());
      // return UploadImage.fromJson(darl);
      // return list.map((e) => UploadImage.fromJson(e)).toList();
      // print(list.map((e) => Datum.fromJson(e)).map((e) => e.uploadImages).toList());
        
    } else{
      return null;
    } 
  }



  
 static errorUni(){
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
  static loaderUni(){
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