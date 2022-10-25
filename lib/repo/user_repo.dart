import 'dart:convert';
import 'dart:io';

import 'package:flutter_course/data/config.dart';
import 'package:flutter_course/data/status_code.dart';
import 'package:flutter_course/model/user_model.dart';
import 'package:flutter_course/repo/api_status.dart';

import 'package:http/http.dart' as http;

class UserReposibility {
  static Future login(String phone, String password) async {
    try {
      var body = {"phone": phone, "pasword": password};
      var response = await http.post(Uri.parse(LOGIN), body: body);
      if (response.statusCode == 200) {
        return Success(response: jsonDecode(response.body));
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: "Invalid Response");
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: "No Internet");
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: "Invalid Format");
    } catch (e) {
      return Failure(code: UNKHOWN_ERROR, errorResponse: "Unknow Error");
    }
  }

  static Future<Object> getUser() async {
    try {
      var response = await http.post(Uri.parse(LOGIN));
      if (response.statusCode == 200) {
        return Success(response: userFromJson(response.body));
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: "Invalid Response");
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: "No Internet");
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: "Invalid Format");
    } catch (e) {
      return Failure(code: UNKHOWN_ERROR, errorResponse: "Unknow Error");
    }
  }
}
