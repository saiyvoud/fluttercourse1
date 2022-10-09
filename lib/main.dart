// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_course/controller/main_controller.dart';
// import 'package:flutter_course/pages/auth/login.dart';
// import 'package:flutter_course/router.dart';
// import 'package:get/get.dart';

// void main() async {
//   Get.lazyPut<AuthController>(() => AuthController());
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Flutter Course',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const LoginPages(),
//       getPages: routes(),
//       // home: const LoginScreen(),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_course/pages/auth/login.dart';
import 'package:flutter_course/router.dart';
import 'package:get/get.dart';

import 'controller/main_controller.dart';

void main() {
  Get.lazyPut<MainController>(() => MainController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Course',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPages(),
      getPages: routes(),

      // home: const LoginScreen(),
    );
  }
}
