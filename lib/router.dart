// ignore_for_file: prefer_const_constructors

import 'package:flutter_course/pages/auth/login.dart';
import 'package:flutter_course/pages/auth/register.dart';
import 'package:flutter_course/pages/home/home.dart';
import 'package:get/get.dart';

// routes() => [
//       GetPage(name: "/login", page: () => LoginPages()),
//       GetPage(name: "/home", page: () => HomePage()),
//       GetPage(name: "/register", page: () => Register()),
//     ];

routes() => [
      GetPage(name: "/login", page: () => LoginPages()),
      GetPage(name: "/register", page: () => Register()),
      GetPage(name: "/home", page: () => HomePage()),
    ];
