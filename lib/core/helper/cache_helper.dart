import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> setData({
    required dynamic value,
    required String key,
  }) {
    if (value is int) {
      return prefs!.setInt(key, value);
    }
    if (value is double) {
      return prefs!.setDouble(key, value);
    }
    if (value is String) {
      return prefs!.setString(key, value);
    }
    if (value is List<String>) {
      return prefs!.setStringList(key, value);
    }
    return prefs!.setBool(key, value);
  }


  static dynamic getData({
    required String key,
  }) {
    return prefs!.get(key);
  }

  static Future<bool> removeData({required key}) async {
    return await prefs!.remove(key);
  }

  static Future<void> clearData() async {
    prefs!.clear();
  }
}
