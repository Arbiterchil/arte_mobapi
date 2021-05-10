import 'package:arte/constants/color.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: decent_white,
      body: SafeArea(
        child:SingleChildScrollView(
          physics: BouncingScrollPhysics(),
        ) 
        ),
    );
  }
}