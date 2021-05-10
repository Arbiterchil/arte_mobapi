

import 'package:arte/api/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{

    TextEditingController name;
    TextEditingController email;
    TextEditingController password;


  @override
    void onInit() {
      // TODO: implement onInit
      name = TextEditingController();
      email = TextEditingController();
      password = TextEditingController();
      super.onInit();
    }


    signUpNow() async{

      var data = {
        "name": name.value.text,
        "email": email.value.text,
        "password": password.value.text,
        "image_profile": "none",
        "category_id": "2"
      };

    ApiServices.signUpNow(data);

    }

    @override
      void onClose() {
        // TODO: implement onClose
        name?.dispose();
        email?.dispose();
        password?.dispose();        
        super.onClose();
      }


}