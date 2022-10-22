// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_null_comparison, sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'package:flutter_course/view/auth/otp.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
      ),
      body: Form(
        key: _form,
        child: SingleChildScrollView(
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
                        if (_form.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => OTPPage(
                                        phone: phone.text,
                                        firstName: firstName.text,
                                        password: password.text,
                                        lastName: lastName.text,
                                      ))));
                        }
                      },
                      child: Text("Register")))
            ],
          ),
        )),
      ),
    );
  }
}
