
import 'package:arte/elements/shared_prefs.dart';
import 'package:arte/views/notification.dart';
import 'package:arte/views/posts.dart';
import 'package:arte/views/profile.dart';
import 'package:arte/views/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeDashController extends GetxController{
  String headline;
  String tokenview;

  final selectedIndex = 0.obs;
  
  // get selectedindexes =>this.selectedIndex.value;
  // set selectedindexes1(indes) => this.selectedIndex.value = indes;
  var pagecontrolls = PageController();
  

  @override
    void onInit()  {
      // TODO: implement onInit
       tokenview = Sharedprefs.getToken() ?? 'None';
      print(Sharedprefs.getToken() ?? 'None');
      update(); 
      super.onInit();
    }

    List<Widget> widgets = 
    [
       PostViews(),
        SearchAuthor(),
        NotificationView(),
          ProfileView()
    ];

  

}