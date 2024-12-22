import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  late SharedPreferences _sharedPreferences;

  /// Initializes the cache by obtaining an instance of SharedPreferences.
  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /// Retrieves a string value associated with the given [key].
  String? getString({required String key}) {
    return _sharedPreferences.getString(key);
  }

  /// Saves data to the local database with the given [key] and [value].
  /// Supports bool, String, int, double, and List<String> types.
  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await _sharedPreferences.setBool(key, value);
    } else if (value is String) {
      return await _sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await _sharedPreferences.setInt(key, value);
    } else if (value is double) {
      return await _sharedPreferences.setDouble(key, value);
    } else if (value is List<String>) {
      return await _sharedPreferences.setStringList(key, value);
    } else {
      throw ArgumentError('Unsupported value type for SharedPreferences');
    }
  }

  /// Retrieves the value associated with the given [key].
  /// Returns a dynamic value that may require casting to the appropriate type.
  dynamic getData({required String key}) {
    return _sharedPreferences.get(key);
  }

  /// Removes the value associated with the given [key].
  Future<bool> removeData({required String key}) async {
    return await _sharedPreferences.remove(key);
  }

  /// Clears all data stored in the SharedPreferences.
  Future<bool> clearData() async {
    return await _sharedPreferences.clear();
  }

  /// Checks if the given [key] exists in the SharedPreferences.
  bool containsKey({required String key}) {
    return _sharedPreferences.containsKey(key);
  }
}
