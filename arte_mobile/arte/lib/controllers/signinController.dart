
import 'package:arte/api/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{


    TextEditingController email;
    TextEditingController password;

    @override
      void onInit() {
        // TODO: implement onInit
        email = TextEditingController();
        password = TextEditingController();
        super.onInit();
      }

      signInNowControll() async{

        var data = {
          "email": email.value.text,
          "password": password.value.text
        };

        ApiServices.signInNow(data);
      }


      @override
        void onClose() {
          // TODO: implement onClose
          email?.dispose();
          password?.dispose();
          super.onClose();
        }

}