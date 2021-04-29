import 'package:arte/constants/color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  
  final Function onPressed;
  final Color color;
  final Color splashColor;
  final String nameText;
  final double width;

  const CustomButton({Key key, this.onPressed, this.color, this.splashColor, this.nameText, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      child: ElevatedButton(
         style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(90)
        ),
        elevation: 0
      ),  
      onPressed: onPressed, 
      child: Center(
        child: Text(nameText,
          style: TextStyle(
            color: decent_white,
            fontFamily: 'Metropolis-Bold',
            fontSize: 16
          ),
          ),
      ),
      ),
    );
  }
}