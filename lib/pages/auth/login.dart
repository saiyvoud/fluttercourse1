// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_course/controller/main_controller.dart';

import 'package:flutter_course/pages/auth/register.dart';
import 'package:flutter_course/widget/widget.dart';
import 'package:get/get.dart';

import '../../controller/main_controller.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({Key? key}) : super(key: key);

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  final phone = TextEditingController();
  final password = TextEditingController();
  final _form = GlobalKey<FormState>();
  // AuthController controller = Get.put(AuthController());

  MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        centerTitle: true,
        // actions: [Text('welcome')],
      ),
      body: Form(
        key: _form,
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset(
                "assets/Privacy policy-bro.png",
                height: 120,
              ),
              SizedBox(height: 10),
              Text(
                'Login your Account',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: phone,
                decoration: InputDecoration(
                  hintText: "phone",
                ),
                validator: (value) {
                  if (value!.isEmpty || value == null) {
                    return "phone is require";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                  hintText: "password",
                ),
                validator: (value) {
                  if (value!.isEmpty || value == null) {
                    return "password is require";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Container(
                height: 50,
                width: 200,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    onPressed: () {
                      if (_form.currentState!.validate()) {
                        // showdone(context);
                        mainController.login(
                            phone.text, password.text, context);
                      }
                    },
                    child: Text('Login')),
              ),
              SizedBox(height: 10),
              Container(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed("/register");
                      },
                      child: Text("Register")))
            ],
          ),
        )),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [],
      )),
    );
  }
}
