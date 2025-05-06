import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveString({
    required String key,
    required String value,
  }) async {
    await _prefs.setString(key, value);
  }

  static String? getString({
    required String key,
  }) {
    return _prefs.getString(key);
  }

  static Future<void> saveInt({
    required String key,
    required int value,
  }) async {
    await _prefs.setInt(key, value);
  }

  static int? getInt({
    required String key,
  }) {
    return _prefs.getInt(key);
  }

  static Future<void> saveBool({
    required String key,
    required bool value,
  }) async {
    await _prefs.setBool(key, value);
  }

  static bool? getBool({
    required String key,
  }) {
    return _prefs.getBool(key);
  }

  static Future<void> saveDouble({
    required String key,
    required double value,
  }) async {
    await _prefs.setDouble(key, value);
  }

  static double? getDouble({required String key}) {
    return _prefs.getDouble(key);
  }

  static Future<void> remove({
    required String key,
  }) async {
    await _prefs.remove(key);
  }

  static Future<void> clear() async {
    await _prefs.clear();
  }
}
