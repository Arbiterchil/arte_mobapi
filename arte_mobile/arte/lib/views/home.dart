import 'package:arte/constants/color.dart';
import 'package:arte/controllers/homeController.dart';
import 'package:arte/extras/bottom_bar.dart';
import 'package:arte/views/notification.dart';
import 'package:arte/views/posts.dart';
import 'package:arte/views/profile.dart';
import 'package:arte/views/search.dart';
import 'package:arte/widgets/appbottrial.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDashView extends StatelessWidget {

  final homedash = Get.put(HomeDashController());

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: BottomAppbar(
          widgets: Obx(()=>BottomNavyBar(
          onItemSelected: (index) => homedash.pagecontrolls.animateToPage(
            homedash.selectedIndex.value = index, 
            duration: Duration(milliseconds: 400), curve: Curves.ease),
          selectedIndex: homedash.selectedIndex.value,
          showElevation: true,
          
          items: [
             BottomNavyBarItem(
       icon: Icon(Icons.linear_scale_outlined),
       title: Text('Post'),
       activeColor: darkish_color,
     ),
     BottomNavyBarItem(
         icon: Icon(Icons.search_rounded),
         title: Text('Search'),
         activeColor: darkish_color
     ),
     BottomNavyBarItem(
         icon: Icon(Icons.notifications),
         title: Text('Notification'),
         activeColor: darkish_color
     ),
      BottomNavyBarItem(
         icon: Icon(Icons.person),
         title: Text('Profile'),
         activeColor: darkish_color
     ),
          ], 
          ),),
        ),
        backgroundColor: decent_white,
        body: WillPopScope(
          onWillPop: () async => false,
          child: SafeArea(
          child: PageView(
            controller: homedash.pagecontrolls,
            onPageChanged: (index) => homedash.selectedIndex.value = index,
            children: 
            [
              PostViews(),
              SearchAuthor(),
              NotificationView(),
              ProfileView()
            ],
          ),
          //   child: SingleChildScrollView(
          //     physics: BouncingScrollPhysics(),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
                  
          //         Text(homedash.tokenview != null ? homedash.tokenview : "no data found"),
          //       ],
          //     ),
          //   ),
          
        ),
        ),
       
    );
  }


  
}