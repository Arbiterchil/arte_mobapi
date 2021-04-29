 String email(String value){

    String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]';
    RegExp regExp = RegExp(pattern);
    if(!regExp.hasMatch(value)) return 'Email is invalid';
    else return null;
}

String password(String value){
  String pattern = r'^.{6,}$';
  RegExp regExp = RegExp(pattern);
  if(!regExp.hasMatch(value)) return 'Paswword to short';
  else return null;
}

String name(String value){
 String pattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Invalid Characters';
      else return null;
}