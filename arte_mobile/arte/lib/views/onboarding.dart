
import 'package:arte/constants/color.dart';
import 'package:arte/controllers/onboardController.dart';
import 'package:arte/routes/names.dart';
import 'package:arte/widgets/appbar.dart';
import 'package:arte/widgets/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding extends StatelessWidget {

   final controllerErchilGod = OnboardController();

  @override
  Widget build(BuildContext context) {
    SizeXGet().init(context);
     return Scaffold(
       backgroundColor: decent_white,
       appBar: AppBarCustom(
        title: 'Skip',
        button: ()=>Get.offNamedUntil(signin,(route)=>false),
      ),
      body: WillPopScope(
        onWillPop: () async => false,
          child: SafeArea(
            child: Stack(
              children: [
                PageView.builder(
                  controller: controllerErchilGod.pageControll,
                  onPageChanged: controllerErchilGod.selectedPagexNumber,
                  itemCount: controllerErchilGod.onBoardPages.length,
                  itemBuilder: (context, index)
                  =>Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Container(
                      child:  SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Container(
                              height: getHeight(150),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     Padding(
                       padding: const EdgeInsets.only(left: 20,right: 20),
                       child: Text(controllerErchilGod.onBoardPages[index].headTitle,
                       style: TextStyle(
                       color: darkish_color,
                        fontSize: getHeight(20),
                       fontFamily: 'Metropolis-SemiBold' ,
                       fontWeight: FontWeight.bold
                       ),),
                     ),
                     SizedBox(height: 15,),
                     Padding(
                     padding: const EdgeInsets.only(left: 50,right: 50),
                     child: Text(controllerErchilGod.onBoardPages[index].secondarytitle,
                     style: TextStyle(
                                  color: not_sopure_black,
                                  fontSize: getHeight(26),
                                  fontFamily: 'Metropolis-Bold' ,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                              ),
                              SizedBox(height: 15,),
                              Padding(
                               padding: const EdgeInsets.only(left: 40,right: 40),
                                child: Text(controllerErchilGod.onBoardPages[index].discription,
                                style: TextStyle(
                                  color: not_sopure_black,
                                  fontSize: getHeight(15),
                                  fontFamily: 'Metropolis-Regular' ,
                                ),
                                ),
                              ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 15,),

                              Image.asset(controllerErchilGod.onBoardPages[index].pngimage),
                             
                              
                              
                            ],
                          ),
                        ),
                    ),
                  ),
                ),
             
              ],
            ),
          
        ),
        
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          height: 75,
          width: MediaQuery.of(context).size.width,
          child:  Padding(
        padding: const EdgeInsets.only(left: 25,right:25,),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Row(
                        children: List.generate(controllerErchilGod.onBoardPages.length,
                        (index)=>Obx(()=>
                        AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          margin: EdgeInsets.only(right: 5),
                          height: 10,
                          width: controllerErchilGod.selectedPagexNumber.value == index ? 20 : 10,
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: controllerErchilGod.selectedPagexNumber.value == index
                              ? darkish_color
                              : not_sopure_black,),
                        ),
                        // Padding(
                        //   padding: controllerErchilGod.selectedPagexNumber.value == index ?
                        //    const EdgeInsets.only(bottom: 25) : const EdgeInsets.only(bottom: 0),
                        //   child: Container(
                        //     margin: const EdgeInsets.all(3),
                        //     width: 15,
                        //     height: 15,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(60),
                        //       color: controllerErchilGod.selectedPagexNumber.value == index
                        //       ? darkish_color
                        //       : not_sopure_black,
                        //       shape: BoxShape.rectangle
                        //     ),
                        //   ),
                        // )
                        )),
                      ),
                    ),
                  ),
                
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 130,
                    height: 52,
                    child: RaisedButton(
                      elevation: 0,
                      onPressed: controllerErchilGod.forwardAct,
                      splashColor: not_sopure_black,
                      color: darkish_color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: Obx(() =>
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(controllerErchilGod.isLastPage ? 'Next' : 'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Metropolis-Semibold',
                            fontSize: 16,
                          ),
                          ),
                        ],
                      ),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
    ),
        ),
      ),
    );
  }
}