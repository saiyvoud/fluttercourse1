// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_course/widget/widget.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final desc = TextEditingController();
  final price = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Form(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  PopupMenuButton(
                      icon: Icon(Icons.more_vert),
                      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                            PopupMenuItem(
                              child: ListTile(
                                leading: Icon(Icons.camera),
                                title: Text('gallery'),
                              ),
                            ),
                            PopupMenuItem(
                              child: ListTile(
                                leading: Icon(Icons.camera_alt),
                                title: Text('camare'),
                              ),
                            )
                          ]);
                },
                child: Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(110),
                  ),
                  child: Icon(Icons.add),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: price,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'firstName',
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: price,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter desc';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'lastName',
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: price,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter price';
                  } else if (value.toString().length < 8) {
                    return 'ເບີໂທລະສັບຕ້ອງມີ 8 ຕົວເລກ';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'phone',
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: price,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter price';
                  } else if (value.toString().length < 8) {
                    return 'ເບີໂທລະສັບຕ້ອງມີ 8 ຕົວເລກ';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: '******',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange)),
                    onPressed: () {},
                    child: const Text('Update Profile'),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
