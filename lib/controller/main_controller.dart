// ignore_for_file: unused_local_variable, unnecessary_brace_in_string_interps, avoid_print

import 'dart:convert';

import 'package:flutter_course/config/config.dart';
import 'package:flutter_course/model/user_model.dart';
import 'package:flutter_course/widget/widget.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

class MainController extends GetxController {
  // ຕົວປ່ຽນເກັບ storage
  final box = GetStorage();
  //is loading
  var loading = true.obs;

  // ເປັນການປະກາດຕົວປ່ຽນເພື່ອນຳໃຊ້ພາຍໃນ
  final _user = Rxn<UserModel>();
  // ເອົາອອກໄປໃສ່ພາຍນອກ
  UserModel? get user => _user.value;

  login(phone, password, context) async {
    try {
      var body = {"phone": phone, "password": password};
      var url = Uri.parse("${END_POINTS}/user/login");
      var response = await http.post(url, body: body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data["msg"] == "Invaild phone or password") {
          showDialogbox(context, "Invaild phone or password");
        } else {
          await setToken(data["token"]);
          await getUserProfile(data["token"]);
          Get.offNamed("/home");
          update();
          return data;
        }
      }
    } catch (e) {
      print("err login ${e}");
    }
  }

  // ສະແດງຂໍ້ມູນຜູ້ໃຊ້
  getUserProfile(token) async {
    try {
      loading(true);
      var url = Uri.parse("${END_POINTS}/user/profile");
      var response = await http.post(url, headers: {"token": token});
      if (response.statusCode == 200) {
        UserModel toJson = userModelFromJson(response.body);
        _user.value = toJson;
        loading(false);
        update();
      }
    } catch (e) {
      loading(false);
      print("err get profile ${e}");
    }
  }

// ບັນທຶກການເຂົ້າລະຫັດ
  setToken(token) async {
    try {
      await box.write("token", token);
    } catch (e) {
      print("err token ${e}");
    }
  }

  register(firstName, lastName, phone, password, context) async {
    try {
      var body = {
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "password": password,
      };
      var response =
          await http.post(Uri.parse("${END_POINTS}/user/register"), body: body);
      if (response.statusCode == 201) {
        print("=====>${response.body}");
        var data = jsonDecode(response.body);
        print("=====>${data}");
        if (data["msg"] == "phone is already") {
          showDialogbox(context, "phone is already");
        }
        await setToken(data["token"]);
        await getUserProfile(data["token"]);
        Get.offNamed("/home");
        update();
        return data;
      }
    } catch (err) {
      print("err  register${err}");
    }
  }

  logout() async {
    await box.remove("token");
  }
}
