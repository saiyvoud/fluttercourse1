// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_course/pages/home/add_product.dart';
import 'package:flutter_course/pages/home/detail.dart';
import 'package:flutter_course/pages/home/editprofile.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditProfile())),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              backgroundImage: AssetImage("assets/user.png"),
            ),
          ),
        ),
        title: Text("Home Screen"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await box.remove("token");
                Get.offAllNamed("/login");
              },
              icon: Icon(Icons.exit_to_app)),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddProduct())),
                child: Text(
                  '+ ເພີ່ມສິນຄ້າ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Card(
                    elevation: 5,
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/sho1.jpeg',
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            width: 220,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ເສື້ອຜູ້ຊາຍສີເທົາ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    'ເສື້ອແຟຊັນ ເໝາະສຳຫລັບຄົນທີ່ຕ້ອງການປັບລຸກຕົວເອງໃຫ້ມີສະເໜ່ຜູ້ສາວຫລົງໄຫລ'),
                                SizedBox(height: 2),
                                Text(
                                  '₭ 150,000 ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ));
              }),
        ],
      )),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

