class ApiArte{


  static const String arte_local = "http://192.168.1.4:8000/api";


  static const String signIn = "$arte_local/arte/signIn";
  static const String signUp = "$arte_local/arte/signUp";
  static const String profile = "$arte_local/arte/profile";

  static const String getPostView = "$arte_local/viewer/postview";
  static const String getUploadImages = "$arte_local/viewer/viewimage/";
 
 
}

class ContentType {
  
  static const String json =  'application/json';
  static const String accepts = 'appilication/json';
}