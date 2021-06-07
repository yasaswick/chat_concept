import 'dart:async' show Future;

import 'package:shared_preferences/shared_preferences.dart';

/// Singleton class to manage SharedPreferences
class PreferenceUtils {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static Future<String> getString(String key, [String? defValue]) async {
    var prefs = await _instance;
    return prefs.getString(key) ?? defValue ?? '';
  }

  static Future<bool> setBoolean(String key, bool value) async {
    var prefs = await _instance;
    return prefs.setBool(key, value);
  }

  static Future<bool> getBoolean(String key, [bool? defValue]) async {
    var prefs = await _instance;
    return prefs.getBool(key) ?? defValue ?? false;
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }
}
