import 'package:arte/routes/route_names.dart';
import 'package:arte/routes/route_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'elements/shared_pref.dart';

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
    defaultTransition: Transition.fade,
    );
  }
}

