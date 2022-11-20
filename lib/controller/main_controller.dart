// ignore_for_file: unused_local_variable, unnecessary_brace_in_string_interps, avoid_print, prefer_final_fields

import 'dart:convert';

import 'package:flutter_course/config/config.dart';
import 'package:flutter_course/model/user_model.dart';
import 'package:flutter_course/widget/widget.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

import '../model/product_model.dart';
import '../utils/helper.dart';

class MainController extends GetxController {
  // ຕົວປ່ຽນເກັບ storage
  final box = GetStorage();

  //is loading
  var loading = true.obs;

  // ເປັນການປະກາດຕົວປ່ຽນເພື່ອນຳໃຊ້ພາຍໃນ
  final Rxn<UserModel> _user = Rxn<UserModel>();

  var productList = <Product>[].obs;
  // ເອົາອອກໄປໃສ່ພາຍນອກ
  UserModel? get user => _user.value;

  @override
  void onInit() async {
    super.onInit();
    await fecthProduct();
  }

  fecthProduct() async {
    try {
      loading(true);
      var url = Uri.parse("${END_POINTS}/product");
      var response = await http.get(url, headers: {"token": box.read("token")});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var item = data["data"];
        productList.clear();
        productList.addAll(
            item.map<Product>((json) => Product.fromJson(json)).toList());
        loading(false);
        update();
      }
    } catch (e) {
      print("err get product ${e}");
      loading(false);
      update();
    }
  }

// login
  login(phone, password, context) async {
    try {
      var body = {"phone": phone, "password": password};
      var url = Uri.parse("${END_POINTS}/user/login");
      var response = await http.post(url, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        Get.back();
        if (data["msg"] == "Invaild phone or password") {
          showDialogbox(context, "Invaild phone or password");
        } else {
          await setToken(data["token"]);
          await getUserProfile(data["token"]);
          Get.offAllNamed("/home");
          update();
        }
      }
    } catch (e) {
      print("err login ${e}");
    }
  }

//
  getUserProfile(token) async {
    try {
      loading(true);
      var url = Uri.parse("${END_POINTS}/user/profile");
      var response = await http.get(url, headers: {"token": token});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        await storeUserData(data);
        UserModel toJson = userFromJson(data);
        _user.value = toJson;
        loading(false);
        update();
      }
    } catch (e) {
      loading(false);
      print("err get profile ${e}");
    }
  }

//
  fetchUserLocal() async {
    try {
      if (box.hasData('token')) {
        loading(true);
        var user = await box.read('user');
        //
        UserModel toJson = userFromJson(user);
        if (user != null) {
          _user.value = toJson;
          loading(false);
          update();
        }
      }
    } finally {
      loading(false);
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

// register
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
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // print(data);
        if (data["msg"] == "phone is already") {
          showDialogbox(context, "phone is already");
        } else {
          await setToken(data["token"]);
          Get.offAllNamed("/login");
          update();
        }
      }
    } catch (err) {
      print("err  register${err}");
      showDialogbox(context, "register error");
    }
  }

  updateProfile(id, firstName, lastName, profile, context) async {
    try {
      var body = {
        "id": id.toString(),
        "firstName": firstName,
        "lastName": lastName,
        "profile": profile,
      };
      var response = await http.put(
          Uri.parse("${END_POINTS}/user/updateProfile"),
          body: body,
          headers: {"token": box.read("token")});

      if (response.statusCode == 201) {
        await box.remove("user");
        await getUserProfile(box.read("token"));
        showDialogSuccess(context, "update profile succesful");
        fetchUserLocal();
        update();
      }
    } catch (err) {
      print("err update profile${err}");
      showDialogbox(context, "update error");
    }
  }

  logout() async {
    await box.remove("token");
    await box.remove("user");
  }

//
  addProduct(name, desc, price, image, context) async {
    try {
      var body = {
        "name": name,
        "description": desc,
        "price": price,
        "image": image
      };
      var respones = await http.post(Uri.parse("${END_POINTS}/product"),
          body: body, headers: {"token": box.read("token")});
      if (respones.statusCode == 200) {
        showDialogSuccess(context, "add product Success");
        fecthProduct();
        update();
      } else {
        showDialogbox(context, "add product error");
        update();
      }
    } catch (e) {
      print("err add product${e}");
      showDialogbox(context, "add product error");
      update();
    }
  }

  updateProduct(id, name, desc, price, image, context) async {
    try {
      var body = {
        "id": id.toString(),
        "name": name,
        "description": desc,
        "price": price,
        "image": image
      };
      var respones = await http.put(Uri.parse("${END_POINTS}/product"),
          body: body, headers: {"token": box.read("token")});
      if (respones.statusCode == 201) {
        showDialogSuccess(context, "update product Success");
        fecthProduct();
        update();
      }
    } catch (e) {
      print("err update product${e}");
      showDialogbox(context, "update product error");
      update();
    }
  }

  deleteProduct(id, context) async {
    try {
      var respones = await http.delete(Uri.parse("${END_POINTS}/product/id"),
          body: {"id": id.toString()}, headers: {"token": box.read("token")});
      if (respones.statusCode == 200) {
        showDialogSuccess(context, "delete product Success");
        fecthProduct();
        Get.offNamed("/home");
        update();
      }
    } catch (e) {
      print("err delete product${e}");
      showDialogbox(context, "delete product error");
      update();
    }
  }
}
