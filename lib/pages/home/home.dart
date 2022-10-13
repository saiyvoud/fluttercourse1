// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_course/pages/home/add_product.dart';
// import 'package:flutter_course/pages/home/detail.dart';
// import 'package:flutter_course/pages/home/editprofile.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Padding(
//           padding: const EdgeInsets.all(5.0),
//           child: InkWell(
//             onTap: () => Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => EditProfile())),
//             child: CircleAvatar(
//               backgroundColor: Colors.black,
//               backgroundImage: AssetImage("assets/user.png"),
//             ),
//           ),
//         ),
//         title: Text("Home Screen"),
//         centerTitle: true,
//         actions: [
//           IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app)),
//         ],
//       ),
//       body: SingleChildScrollView(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20.0),
//             child: Container(
//               height: 50,
//               width: 200,
//               child: ElevatedButton(
//                 style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(Colors.green)),
//                 onPressed: () => Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => AddProduct())),
//                 child: Text(
//                   '+ ເພີ່ມສິນຄ້າ',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ),
//           Column(
//             children: [
//               Card(
//                   elevation: 5,
//                   color: Colors.white,
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Image.asset(
//                           'assets/sho1.jpeg',
//                           fit: BoxFit.cover,
//                           height: 100,
//                           width: 100,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 10),
//                         child: Container(
//                           width: 220,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'ເສື້ອຜູ້ຊາຍສີເທົາ',
//                                 style: TextStyle(
//                                     fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                   'ເສື້ອແຟຊັນ ເໝາະສຳຫລັບຄົນທີ່ຕ້ອງການປັບລຸກຕົວເອງໃຫ້ມີສະເໜ່ຜູ້ສາວຫລົງໄຫລ'),
//                               SizedBox(height: 2),
//                               Text(
//                                 '₭ 150,000 ',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     color: Colors.red,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   )),
//               Card(
//                   elevation: 5,
//                   color: Colors.white,
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Image.asset(
//                           'assets/sho2.jpeg',
//                           fit: BoxFit.cover,
//                           height: 100,
//                           width: 100,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 10),
//                         child: Container(
//                           width: 220,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'ເສື້ອແຈກເກັດສີຂຽວເຂັ້ມ',
//                                 style: TextStyle(
//                                     fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                   'ເສື້ອແຟຊັນ ເໝາະສຳຫລັບຄົນທີ່ຕ້ອງການປັບລຸກຕົວເອງໃຫ້ມີສະເໜ່ຜູ້ສາວຫລົງໄຫລ'),
//                               SizedBox(height: 2),
//                               Text(
//                                 '₭ 250,000 ',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     color: Colors.red,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   )),
//               InkWell(
//                 onTap: () => Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => Detail())),
//                 child: Card(
//                     elevation: 5,
//                     color: Colors.white,
//                     child: Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Image.asset(
//                             'assets/sho.jpeg',
//                             fit: BoxFit.cover,
//                             height: 100,
//                             width: 100,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 10),
//                           child: Container(
//                             width: 220,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'ເສື້ອແຟຊັນສີຄີມ',
//                                   style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 Text(
//                                     'ເສື້ອແຟຊັນ ເໝາະສຳຫລັບຄົນທີ່ຕ້ອງການປັບລຸກຕົວເອງໃຫ້ມີສະເໜ່ຜູ້ສາວຫລົງໄຫລ'),
//                                 SizedBox(height: 2),
//                                 Text(
//                                   '₭ 200,000 ',
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       color: Colors.red,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     )),
//               ),
//               Card(
//                   elevation: 5,
//                   color: Colors.white,
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Image.asset(
//                           'assets/sho3.jpeg',
//                           fit: BoxFit.cover,
//                           height: 100,
//                           width: 100,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 10),
//                         child: Container(
//                           width: 220,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'ເສື້ອຜູ້ຊາຍສຸດເທ່ສີຂາວ',
//                                 style: TextStyle(
//                                     fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                   'ເສື້ອແຟຊັນ ເໝາະສຳຫລັບຄົນທີ່ຕ້ອງການປັບລຸກຕົວເອງໃຫ້ມີສະເໜ່ຜູ້ສາວຫລົງໄຫລ'),
//                               SizedBox(height: 2),
//                               Text(
//                                 '₭ 250,000 ',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     color: Colors.red,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   )),
//             ],
//           )
//         ],
//       )),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_course/widget/loading.dart';
import 'package:get/get.dart';

import '../../controller/main_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MainController controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.loading.value) {
        return LoadingPage();
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text('Home Page'),
            centerTitle: true,
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app)),
            ],
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                width: 60,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(60)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: controller.user!.profile == null ||
                          controller.user!.profile == ""
                      ? Image.asset(
                          "assets/user.png",
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          "${controller.user!.profile}",
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green)),
                        onPressed: () {},
                        child: Text(
                          "+ ເພີ່ມສິນຄ້າ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      Card(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/sho1.jpeg',
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('sdsdsdsd'),
                                    Text('sdfdgfgdfdfdfd'),
                                    Text(
                                        'fhjdjdfjdsjkfjsjlkfsdsdsdsdsdsdsdsdsdsdsd')
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
