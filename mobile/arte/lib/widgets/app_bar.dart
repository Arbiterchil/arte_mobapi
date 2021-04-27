import 'package:arte/constants/color.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final double _pref = 60.0;
  final String title;
  final Function button;

  const AppBarCustom({Key key, this.title, this.button})
      : assert(title != null),
        assert(button != null);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
        child: Container(
          height: _pref,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.transparent),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  splashColor: light_color,
                  onTap: button,
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'OpenSans-Semibold',
                        color: light_color),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_pref);
}