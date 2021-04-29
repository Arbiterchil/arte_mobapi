import 'package:flutter/material.dart';

class SizeXGet
{

  static MediaQueryData _mediaQuery;
  static double screenWidth;
  static double screenHeight;
  static double defaultsize;
  static Orientation orientation;  

  void init(BuildContext context){
    _mediaQuery = MediaQuery.of(context);
    screenHeight = _mediaQuery.size.height;
    screenWidth  = _mediaQuery.size.width;
    orientation  = _mediaQuery.orientation; 
  }
}
  double getHeight(double input){
    double height = SizeXGet.screenHeight;
    return (input / 812.0) * height;
  }

  double getWidth(double input){
    double width = SizeXGet.screenWidth;
    return (input / 375.0) * width;
  }