import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefService {
  Future<void> setSharedPref(String key, String value);
  Future<String?> getSharedPref(String key);
  Future<void> removeSharedPref(String key);
  Future<void> clearSharedPref();
}

class SharedPrefServiceImpl implements SharedPrefService {
  final Future<SharedPreferences> _sharedPreferences;

  SharedPrefServiceImpl({required Future<SharedPreferences> sharedPreferences})
    : _sharedPreferences = sharedPreferences;

  @override
  Future<void> clearSharedPref() async {
    final prefs = await _sharedPreferences;
    await prefs.clear();
  }

  @override
  Future<String?> getSharedPref(String key) async {
    final prefs = await _sharedPreferences;
    return prefs.getString(key);
  }

  @override
  Future<void> removeSharedPref(String key) async {
    final prefs = await _sharedPreferences;
    await prefs.remove(key);
  }

  @override
  Future<void> setSharedPref(String key, String value) async {
    final prefs = await _sharedPreferences;
    await prefs.setString(key, value);
  }

  factory SharedPrefServiceImpl.create() {
    return SharedPrefServiceImpl(
      sharedPreferences: Future<SharedPreferences>.value(
        SharedPreferences.getInstance(),
      ),
    );
  }
}
