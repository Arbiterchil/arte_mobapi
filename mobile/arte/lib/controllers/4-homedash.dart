

import 'package:arte/elements/shared_pref.dart';
import 'package:arte/widgets/drawer_1/collapse/item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDashController extends GetxController{
  String headline;
  String tokenview;

  List<CollapsibleItem> items;

  
  

  @override
    void onInit()  {
      // TODO: implement onInit
      
      items = _generateItems;
      
    headline = items.firstWhere((item) => item.isSelected).text;

      tokenview = Sharedprefs.getToken() ?? 'None';
      print(Sharedprefs.getToken() ?? 'None'); 
      
    
      super.onInit();
      update();
    }

  

 List<CollapsibleItem> get _generateItems {
   
    return [
      
      CollapsibleItem(
        text: 'Dashboard',
        icon: Icons.assessment,
        onPressed: () =>headline = 'DashBoard',
        isSelected: true,
      
      ),
      CollapsibleItem(
        text: 'Errors',
        icon: Icons.cancel,
        onPressed: () =>headline = 'Errors'
      ),
      CollapsibleItem(
        text: 'Search',
        icon: Icons.search,
        onPressed: () => headline = 'Search'
      ),
      CollapsibleItem(
        text: 'Notifications',
        icon: Icons.notifications,
        onPressed: () => headline = 'Notifications'
      ),
    ];
    
  }



}