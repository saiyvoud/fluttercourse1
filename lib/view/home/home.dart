// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures, sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'add_product.dart';

import 'editprofile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditProfile())),
            child: Container(
              height: 50,
              width: 50,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              // child: controller.user!.profile == null ||
              //         controller.user!.profile == ""
              //     ? Image.asset(
              //         "assets/user.png",
              //         fit: BoxFit.cover,
              //       )
              //     : Image.network(
              //         "${controller.user!.profile}",
              //         fit: BoxFit.cover,
              //       ),
            ),
          ),
        ),
        title: Text("Home Screen"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () async {}, icon: Icon(Icons.exit_to_app)),
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
          // ListView.builder(
          //     shrinkWrap: true,
          //     primary: false,

          //     itemBuilder: (context, index) {
          //       var data = index;
          //       return InkWell(
          //         onTap: () {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => Detail(
          //                         product: data[index],
          //                       )));
          //         },
          //         child: Card(
          //             elevation: 5,
          //             color: Colors.white,
          //             child: Row(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Padding(
          //                   padding: const EdgeInsets.all(8.0),
          //                   child: Image.network(
          //                     '${data[index].image}',
          //                     fit: BoxFit.cover,
          //                     height: 100,
          //                     width: 100,
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding:
          //                       const EdgeInsets.symmetric(vertical: 10),
          //                   child: Container(
          //                     width: 220,
          //                     child: Column(
          //                       crossAxisAlignment:
          //                           CrossAxisAlignment.start,
          //                       mainAxisAlignment:
          //                           MainAxisAlignment.spaceBetween,
          //                       children: [
          //                         Text(
          //                           '${data[index].name}',
          //                           style: TextStyle(
          //                               fontSize: 18,
          //                               fontWeight: FontWeight.bold),
          //                         ),
          //                         Text('${data[index].description}'),
          //                         SizedBox(height: 2),
          //                         Text(
          //                           '₭ ${data[index].price}',
          //                           style: TextStyle(
          //                               fontSize: 20,
          //                               color: Colors.red,
          //                               fontWeight: FontWeight.bold),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 )
          //               ],
          //             )),
          //       );
          //     }),
        ],
      )),
    );
  }
}
