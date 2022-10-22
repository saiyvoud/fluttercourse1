import 'package:flutter_course/model/user_model.dart';

import 'package:http/http.dart' as http;

class UserReposibility {
  static Future<Object> getUser() async {
    return userFromJson("");
  }
}
