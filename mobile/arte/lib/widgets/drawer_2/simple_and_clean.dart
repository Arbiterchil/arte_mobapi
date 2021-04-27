


import 'package:arte/widgets/drawer_2/controller.dart';
import 'package:arte/widgets/drawer_2/items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleDrawerAnimation extends StatelessWidget {

  final drawe = Get.put(SimpleDrawerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            height: MediaQuery.of(context).size.height,
            width: 101.0,
            decoration: BoxDecoration(
              color: Color(0xff332A7C),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 110,
                  child: Column(
                    children: drawe.icons.map((e)
                    => NavBarItem(
                      icon: e,
                      selected: drawe.selected[drawe.icons.indexOf(e)],
                      onTap: () => drawe.select(drawe.icons.indexOf(e)),
                    ),
                    ).toList(),
                    // children: icon
                    //     .map(
                    //       (e) => NavBarItem(
                    //         icon: e,
                    //         selected: selected[icon.indexOf(e)],
                    //         onTap: () {
                    //           setState(() {
                    //             select(icon.indexOf(e));
                    //           });
                    //         },
                    //       ),
                    //     )
                    //     .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}