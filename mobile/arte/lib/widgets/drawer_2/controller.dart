

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleDrawerController extends GetxController{

    List<bool> selected =[true,false,false,false,false];
    List<IconData> icons = [
      Icons.email,
      Icons.lock,
      Icons.monitor,
      Icons.folder,
      Icons.wifi_rounded
    ]; 

    void select(int index){
      for(int i = 0; i < 5; i++){
        if(i == i){
          selected[i] = true;
          update();
        }else{
          selected[i] = false;
          update();
        }
      }
    }


}