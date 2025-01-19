import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  //Initalize of cache
  init() async {
    sharedPreferences = await SharedPreferences.getInstance(); //اخد نسخه
  }

  //store or save data in Shared Preferences
  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  //get data from Shared Preferences type string
  String? getDataString({
    required String key,
  }) {
    return sharedPreferences.getString(key);
  }

  //get any type of data from Shared Preferences already saved
  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  //delete data from Shared Preferences
  Future<bool> deleteData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  //delete all data from Shared Preferences
  Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }

  //check fo specific key is exist
  Future<bool> checkData({required String key}) async {
    return sharedPreferences.containsKey(key);
  }
}
