import 'package:flutter/material.dart';

class BottomAppbar extends StatelessWidget implements PreferredSizeWidget{
  final double _pref = 60.0;
  final Widget widgets;

  const BottomAppbar({Key key, this.widgets}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: _pref,
        width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.transparent),
          child: widgets,
      ),
    );
  }

   @override
  Size get preferredSize => Size.fromHeight(_pref);

}