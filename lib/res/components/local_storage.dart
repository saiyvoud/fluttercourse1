// ignore_for_file: deprecated_member_use, no_leading_underscores_for_local_identifiers

import 'package:flutter_course/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<bool> saveUser(UserModel userModel) async {
    final _pref = await SharedPreferences.getInstance();

    _pref.setInt("id", int.parse(userModel.id.toString()));
    _pref.setString("firstName", userModel.firstName.toString());
    _pref.setString("lastName", userModel.lastName.toString());
    _pref.setString("phone", userModel.phone.toString());
    _pref.setString("profile", userModel.profile.toString());
    _pref.setString("token", userModel.token.toString());
    return _pref.commit();
  }

  static Future<UserModel> getUser() async {
    final _pref = await SharedPreferences.getInstance();

    int? id = _pref.getInt("id");
    String? firstName = _pref.getString("firstName");
    String? lastName = _pref.getString("lastName");
    String? phone = _pref.getString("phone");
    String? profile = _pref.getString("profile");
    String? token = _pref.getString("token");
    return UserModel(
      id: id,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      profile: profile,
      token: token,
    );
  }

  static Future<String> getToken() async {
    final _pref = await SharedPreferences.getInstance();
    String? token = _pref.getString("token");
    return token!;
  }

  void removeUser() async {
    final _pref = await SharedPreferences.getInstance();

    _pref.remove("id");
    _pref.remove("firstName");
    _pref.remove("lastName");
    _pref.remove("phone");
    _pref.remove("profile");
    _pref.remove("token");
  }
}
