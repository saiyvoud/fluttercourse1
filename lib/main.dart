import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/controller/main_controller.dart';
import 'package:flutter_course/pages/auth/login.dart';
import 'package:flutter_course/pages/home/splash.dart';
import 'package:flutter_course/router.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  Get.lazyPut<MainController>(() => MainController());

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
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
      home: const SplashScreen(),
      getPages: routes(),
    );
  }
}
