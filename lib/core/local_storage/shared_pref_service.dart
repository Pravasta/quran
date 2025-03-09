abstract class SharedPrefService {
  Future<void> setSharedPref(String key, String value);
  Future<String?> getSharedPref(String key);
  Future<void> removeSharedPref(String key);
  Future<void> clearSharedPref();
}
