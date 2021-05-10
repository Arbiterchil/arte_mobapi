import 'package:arte/constants/color.dart';
import 'package:flutter/material.dart';

class LoadData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
                                    height:300,
                                    child: Stack(
                                      children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: darkish_color,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation(darkish_color),
                                    backgroundColor: decent_white),
                              )
                              
                            ),
                          ),
                                      ],
                        ),
                                  );
  }
}