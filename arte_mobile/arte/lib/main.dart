import 'package:arte/elements/shared_prefs.dart';
import 'package:arte/routes/names.dart';
import 'package:arte/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Sharedprefs.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: splash_startscreen,
    getPages: NameRoute.routes,
    defaultTransition: Transition.leftToRight,
    transitionDuration: Duration(milliseconds: 400),
    );
  }
}