// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/data/response.dart';
import 'package:flutter_course/model/user_model.dart';
import 'package:flutter_course/repo/api_status.dart';
import 'package:flutter_course/repo/user_repo.dart';
import 'package:flutter_course/utils/router_name.dart';

class AuthProvider extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _userListModel = [];
  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userlistModel) {
    _userListModel = userlistModel;
  }

  setUserError() {}

  getUser() async {
    setLoading(true);
    var response = await UserReposibility.getUser();
    if (response is Success) {
      setUserListModel(response.response as List<UserModel>);
    }
    if (response is Failure) {
      setUserError();
    }
    setLoading(false);
  }

  loginUser(phone, password, context) async {
    var data = await UserReposibility.login(phone, password);
    if (data["msg"] == LOGIN_SUCCESS) {
      await setToken(data["token"]);
      Navigator.pushNamed(context, RoutesName.home);
    } else if (data["msg"] == INVALID_LOGIN) {
    } else {
      if (kDebugMode) {
        print(data.toString());
      }
    }
  }

  setToken(token) {}
}
