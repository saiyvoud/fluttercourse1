// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_course/pages/auth/otp.dart';

// class Register extends StatelessWidget {
//   Register({Key? key}) : super(key: key);

//   final _formKey = GlobalKey<FormState>();
//   final firstName = TextEditingController();
//   final lastName = TextEditingController();
//   final phone = TextEditingController();
//   final password = TextEditingController();
//   final comfirm_password = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Register'),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Column(
//                 children: [
//                   SizedBox(height: 10),
//                   Image.asset(
//                     'assets/Privacy policy-bro.png',
//                     height: 150,
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     "Create your account",
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   SizedBox(height: 10),
//                   TextFormField(
//                     controller: phone,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter firstName';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                       hintText: 'firstName',
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   TextFormField(
//                     controller: phone,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter lastName';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                       hintText: 'lastName',
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   TextFormField(
//                     controller: phone,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter phone';
//                       } else if (value.toString().length < 8) {
//                         return 'ເບີໂທລະສັບຕ້ອງມີ 8 ຕົວເລກ';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                       hintText: 'phone',
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   TextFormField(
//                     controller: phone,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter password';
//                       } else if (value.toString().length < 8) {
//                         return 'ລະຫັດຕ້ອງບໍ່ຕໍ່າກວ່າ 6 ຕົວ';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                       hintText: 'password',
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   TextFormField(
//                     controller: phone,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter comfirm password';
//                       } else if (value.toString().length < 8) {
//                         return 'ລະຫັດຕ້ອງບໍ່ຕໍ່າກວ່າ 6 ຕົວ';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                       hintText: 'comfirm password',
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 20.0),
//                     child: Container(
//                       height: 50,
//                       width: 200,
//                       child: ElevatedButton(
//                         style: ButtonStyle(
//                             backgroundColor:
//                                 MaterialStateProperty.all(Colors.orange)),
//                         onPressed: () => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => OTPScreen(
//                                     phone: phone.text,
//                                   )),
//                         ),

//                         // onPressed: () {
//                         //   if (_formKey.currentState!.validate()) {
//                         //     ScaffoldMessenger.of(context).showSnackBar(
//                         //       const SnackBar(content: Text('Processing Data')),
//                         //     );
//                         //   }
//                         // },
//                         child: const Text('Register'),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_course/controller/main_controller.dart';
import 'package:flutter_course/pages/auth/otp.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  final comfirm_password = TextEditingController();
  final _form = GlobalKey<FormState>();
  final MainController controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset(
              "assets/Privacy policy-bro.png",
              height: 120,
            ),
            Text(
              'Create your Account',
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              controller: firstName,
              decoration: InputDecoration(hintText: 'firstName'),
              validator: (value) {
                if (value!.isEmpty || value == null) {
                  return "firstName is require";
                }
                return null;
              },
            ),
            TextFormField(
              controller: lastName,
              decoration: InputDecoration(hintText: 'lastName'),
              validator: (value) {
                if (value!.isEmpty || value == null) {
                  return "lastName is require";
                }
                return null;
              },
            ),
            TextFormField(
              controller: phone,
              decoration: InputDecoration(hintText: 'phone'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty || value == null) {
                  return "phone is require";
                }
                return null;
              },
            ),
            TextFormField(
              controller: password,
              decoration: InputDecoration(hintText: 'password'),
              validator: (value) {
                if (value!.isEmpty || value == null) {
                  return "password is require";
                }
                return null;
              },
            ),
            TextFormField(
              controller: comfirm_password,
              decoration: InputDecoration(hintText: 'comfirm password'),
              validator: (value) {
                if (value!.isEmpty || value == null) {
                  return "comfirm password is require";
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            Container(
                height: 50,
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      controller.register(firstName.text, lastName.text,
                          phone.text, password.text, context);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: ((context) => OTPPage(
                      //               phone: phone.text,
                      //               firstName: firstName.text,
                      //               password: password.text,
                      //               lastName: lastName.text,
                      //             ))));
                    },
                    child: Text("Register")))
          ],
        ),
      )),
    );
  }
}
