import 'package:arte/constants/color.dart';
import 'package:flutter/material.dart';

class CustomTextfields extends StatelessWidget {

final TextEditingController controller;
final String Function(String) validators;
final TextInputType keyboardType;
final bool obsecure;
final int minlines;
final void Function(String) onChanged;
final void Function(String) onsaved;
final String tagonTop;
final String hintText;
final IconData icons;

  const CustomTextfields({Key key, this.controller, this.validators, this.keyboardType, this.obsecure, this.minlines, this.onChanged, this.onsaved, this.tagonTop, this.hintText, this.icons}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        autofocus: false,
        controller: controller,
        onChanged: onChanged,
        onSaved: onsaved,
        obscureText: obsecure,
        validator: validators,
        keyboardType: keyboardType,
        
        style: TextStyle(
          color: darkish_color,
          fontFamily: "Metropolis-Regular",
          fontSize: 18,
          letterSpacing: 1
        ),
        autocorrect: true,
        decoration: InputDecoration(
          errorText: '',
          filled: true,
          fillColor: opacityBlueish,
          hintText: hintText,
          hintStyle: TextStyle(
          color: darkish_color,
          fontFamily: "Metropolis-Regular",
          fontSize: 18,
          letterSpacing: 1
        ),
        prefixIcon: new Icon(icons,color: not_sopure_black,),
        prefixText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(90),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(90),
            borderSide: BorderSide(color: darkish_color),
          ),
        ),
      ),
    );
  }
}