
import 'package:arte/elements/shared_prefs.dart';
import 'package:get/get.dart';

class HomeDashController extends GetxController{
  String headline;
  String tokenview;


  
  

  @override
    void onInit()  {
      // TODO: implement onInit
       tokenview = Sharedprefs.getToken() ?? 'None';
      print(Sharedprefs.getToken() ?? 'None'); 
      super.onInit();
    }

  

}