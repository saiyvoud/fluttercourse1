// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, sized_box_for_whitespace

import 'package:flutter/material.dart';

import '../widget/widget.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({Key? key}) : super(key: key);

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  final phone = TextEditingController();
  final password = TextEditingController();
  final _form = GlobalKey<FormState>();

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
                        showdone(context);
                      }
                    },
                    child: Text('Login')),
              ),
              SizedBox(height: 10),
              Container(
                  height: 50,
                  width: 200,
                  child:
                      ElevatedButton(onPressed: () {}, child: Text("Register")))
            ],
          ),
        )),
      ),
    );
  }
}
