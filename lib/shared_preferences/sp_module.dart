
import 'package:shared_preferences/shared_preferences.dart';

class SPModule {
  late SharedPreferences _sharedPreferences;

  Future<SPModule> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();

    return this;
  }

  Future<bool> setString(String key, String? value) async => value == null
      ? _sharedPreferences.remove(key)
      : _sharedPreferences.setString(key, value);

  String? getString(String key) => _sharedPreferences.getString(key);

  Future<bool> setBool(String key, bool? value) async => value == null
      ? _sharedPreferences.remove(key)
      : _sharedPreferences.setBool(key, value);

  bool? getBool(String key) => _sharedPreferences.getBool(key);

  Future<bool> setDouble(String key, double? value) async => value == null
      ? _sharedPreferences.remove(key)
      : _sharedPreferences.setDouble(key, value);

  double? getDouble(String key) => _sharedPreferences.getDouble(key);

  Future<bool> clear() => _sharedPreferences.clear();
}