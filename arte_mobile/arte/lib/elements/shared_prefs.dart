import 'package:shared_preferences/shared_preferences.dart';

class Sharedprefs
{
  static SharedPreferences _preferences;

  static const tokens = "token";

  static Future init() async=>
  _preferences = await SharedPreferences.getInstance();

  //Set Token
  static Future usertoken(String token)  async =>
  await _preferences.setString(tokens,token);

  //Get Token
  static String getToken() => _preferences.getString(tokens);

  //Clear Token 
  static Future<bool> removeToken() async => await _preferences.remove(tokens);

  //Clear All Optional for me
  static Future<bool> clearAll() async => await _preferences.clear();
}