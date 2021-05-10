import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Sharedprefs
{
  static SharedPreferences _preferences;

  static const tokens = "token";
  static const author_And_fan = "userDetails";

  static const onboardDone = "done";

  static Future init() async=>
  _preferences = await SharedPreferences.getInstance();

  //Set Token
  static Future usertoken(String token)  async =>
  await _preferences.setString(tokens,token);

  //Set Users Data in jsonEncode
  static Future setUsersDetails(String data) async =>
  await _preferences.setString(author_And_fan,data);

  static Future setDoneOnBoard(String view) async =>
  await _preferences.setString(onboardDone, view);

  //Get Token
  static String getToken() => _preferences.getString(tokens);
  //Get User Data and Decode them
  static get getuserdetails{
    var userData = _preferences.getString(author_And_fan);
    var userDecode = json.decode(userData);
    return userDecode;
  }

  static String getDone() => _preferences.getString(onboardDone);

  //Clear Token 
  static Future<bool> removeToken() async => await _preferences.remove(tokens);

  //Clear All Optional for me
  static Future<bool> clearAll() async => await _preferences.clear();
}