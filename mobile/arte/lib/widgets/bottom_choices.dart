
import 'package:arte/constants/color.dart';
import 'package:flutter/material.dart';

class BottomXchoice extends StatelessWidget {

  final String firsttext;
  final String secondtext;
  final Function ontap;
  final Color color;

  const BottomXchoice({Key key, this.firsttext, this.secondtext, this.ontap, this.color}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorless
      ),
      child: GestureDetector(
        onTap: ontap,
        child: RichText(
          
          text: TextSpan(
            children: [
              TextSpan(
                text: firsttext,
                style: TextStyle(
                  color: not_sopure_black,
                  fontSize: 14,
                  fontFamily: "Metropolis-Regular"
                )
              ),
              TextSpan(
                text: secondtext,
                style: TextStyle(
                  color: color,
                  fontSize: 14,
                  fontFamily: "Metropolis-Regular"
                )
              ),
            ]
          ),
        ),
      ),
    );
  }
}