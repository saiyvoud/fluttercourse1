// ignore_for_file: unused_local_variable, unnecessary_brace_in_string_interps, avoid_print

import 'dart:convert';

import 'package:flutter_course/config/config.dart';
import 'package:flutter_course/model/user_model.dart';
import 'package:flutter_course/widget/widget.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

import '../service/variable.dart';

class AuthController extends GetxController {
  // local storage
  final box = GetStorage();
  // loading
  var isLoadingProfile = true.obs;
  var isLoadingProduct = true.obs;
  // data store
  final _user = Rxn<UserModel>();
  //get to
  UserModel? get user => _user.value;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    if (!box.read("token")) {
      await fetchProduct();
    }
  }

  checkAuth() async {}
  fetchProduct() async {
    try {} catch (err) {}
  }

  login(phone, password, context) async {
    try {
      var body = {
        "phone": phone,
        "password": password,
      };

      var url = Uri.parse("${END_POINT}/user/login");

      final response = await http.post(url, body: body);
      Get.back();
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data["msg"] == "Invaild phone or password") {
          showDialogbox(context, "Invaild phone or password");
        } else {
          await setToken(data["token"]);
          await getUserProfile(data["token"]);
          Get.toNamed("/home");
          return data;
        }
      } else {
        showDialogbox(context, "login faild");
      }
    } catch (err) {
      print("errr${err}");
    }
  }

  register(firstName, lastName, phone, password) async {
    try {
      var body = {
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "password": password,
      };

      var response =
          await http.post(Uri.parse("${END_POINT}/user/register"), body: body);
      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        await setToken(data["token"]);
        await getUserProfile(data["token"]);
        Get.offNamed("/home");
        return data;
      }
    } catch (err) {
      print("err  register${err}");
    }
  }

  setToken(token) async {
    try {
      await box.write("token", token);
    } catch (err) {
      print("errr${err}");
    }
  }

  getUserProfile(token) async {
    try {
      isLoadingProfile(true);
      final response = await http.get(Uri.parse("${END_POINT}/user/profile"),
          headers: {"token": token});
      print(response.body);
      if (response.statusCode == 200) {
        UserModel toJson = userModelFromJson(response.body);
        _user.value = toJson;
        isLoadingProfile(false);
        update();
      }
    } catch (err) {
      print("err get profile${err}");
      isLoadingProfile(false);
      update();
    }
  }
}

class MainController extends GetxController {
  // ຕົວປ່ຽນເກັບ storage
  final box = GetStorage();
  //is loading
  var lodingProfile = true.obs;

  // ເປັນການປະກາດຕົວປ່ຽນເພື່ອນຳໃຊ້ພາຍໃນ
  final _user = Rxn<UserModel>();
  // ເອົາອອກໄປໃສ່ພາຍນອກ
  UserModel? get user => _user.value;

  login(phone, password, context) async {
    try {
      var body = {"phone": phone, "password": password};
      var url = Uri.parse("${END_POINTS}/user/login");
      var response = await http.post(url, body: body);
      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data["msg"] == "Invaild phone or password") {
          print("Invaild phone or password");
        } else {
          await setToken(data["token"]);
          await getUserProfile(data["token"]);
          showDialogSuccess(context, "login successful");
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
      lodingProfile(true);
      var url = Uri.parse("${END_POINTS}/user/profile");
      var response = await http.post(url, headers: {"token": token});
      if (response.statusCode == 200) {
        UserModel toJson = userModelFromJson(response.body);
        _user.value = toJson;
        lodingProfile(false);
        update();
      }
    } catch (e) {
      lodingProfile(false);
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

  register(firstName, lastName, phone, password) async {
    try {
      var body = {
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "password": password,
      };
      var response =
          await http.post(Uri.parse("${END_POINT}/user/register"), body: body);
      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        if (data["msg"] == "phone is already") {
          print("phone is already");
        }
        await setToken(data["token"]);
        await getUserProfile(data["token"]);
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
