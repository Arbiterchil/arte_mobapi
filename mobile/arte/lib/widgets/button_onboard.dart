import 'package:arte/constants/color.dart';
import 'package:arte/controllers/1-onboard_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottomCustomOnBoard extends StatelessWidget {
  final cotrollerErchil = OnboardController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15,right:15,),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Row(
                  children: List.generate(cotrollerErchil.onBoardPages.length,
                  (index)=>Obx(()=>
                  Container(
                    margin: const EdgeInsets.all(6),
                    width: 21,
                    height: 3,
                    decoration: BoxDecoration(
                      color: cotrollerErchil.selectedPagexNumber.value == index
                      ? not_sopure_black
                      : darkish_color,
                      shape: BoxShape.rectangle
                    ),
                  )
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}