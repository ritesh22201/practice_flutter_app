import 'dart:convert';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:neet_flutter_app/routes/route_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String userToken = 'userToken';
const String userId = 'userId';
const String userName='userName';
const String userEmail = 'userEmail';
const String userPhone = 'userPhone';
const String userCreatedAt = 'userCreatedAt';


Future<bool> checkPrefKey (String key) async{
  final prefs = await SharedPreferences.getInstance();
  return prefs.containsKey(key);
}

Future<String?>? getStringPrefValue(String key) async{
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

save(String key, Uint8List obj) async {
  final prefs = await SharedPreferences.getInstance();
  final base64String = base64Encode(obj);
  return prefs.setString(key, base64String);
}

read(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

setPrefStringValue(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

Future<bool> removePrefStringValue (String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.remove(key);
}

Future<bool> removePrefAllLocalData(String key) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.getKeys().removeWhere((element) => element.contains(key));
  return true;
}

Future<bool> getPrefBoolValue(String key) async{
  final prefs = await SharedPreferences.getInstance();
  bool? res = prefs.getBool(key);
  return res ?? false;
}

setPrefBoolValue(String key, bool value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, value);
}

Future<int?>? getPrefIntValue(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt(key);
}

setPrefIntValue(String key, int value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt(key, value);
}

Future<double?>? getPrefDoubleValue(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getDouble(key);
}

setPrefDoubleValue(String key, double value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setDouble(key, value);
}

Future<List<String>?>? getPrefListValue(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList(key);
}

setPrefListValue(String key, List<String> value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setStringList(key, value);
}

Future<Set<String>> getPrefKeys() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getKeys();
}

removePrefValue(String key) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove(key);
}

clearPref() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.clear().then((value) {
    Get.toNamed(RouteHelper.getLoginPage());
  });
}


