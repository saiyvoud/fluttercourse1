import 'package:flutter_course/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<void> saveData(UserModel user) async {
    final _pref = await SharedPreferences.getInstance();
  }
}
