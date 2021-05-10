

import 'dart:convert';

import 'package:arte/api/services.dart';
import 'package:arte/models/posts.dart';
import 'package:get/get.dart';

class PostController extends GetxController {

    var usedMe;
    var isLoad = true.obs;
    var imgload = true.obs;
    var posts = [].obs;
    var img = [].obs;
    var id = [].obs;
    @override
      void onInit() {
        // TODO: implement onInit
        getPost();
        // upload();
        super.onInit();
      }

  void getPost() async{ 

    isLoad(true);

    try{
      var postings = await ApiServices.getPost();
      
      if(postings != null) {
        posts.value = postings;
        //.=/
        
      
      }
    }finally {
      isLoad(false);
    }

   }

//   void upload() async{
//    imgload(true);
//     try{
//       var uploads = await ApiServices.getPostUpload();
//     if(uploads != null){
//       img.value = uploads;
//       print(uploads);
//     }
//     }finally{
//       imgload(false);
//     }
//  }
}