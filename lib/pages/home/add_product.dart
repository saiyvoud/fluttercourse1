// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_course/controller/main_controller.dart';
import 'package:flutter_course/widget/widget.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final desc = TextEditingController();
  final price = TextEditingController();
  final MainController controller = Get.put(MainController());
  String? imgFile;
  File? file;
  Future chooseImage(ImageSource imageSource, BuildContext context) async {
    try {
      var object = await ImagePicker().getImage(
        source: imageSource,
      );
      setState(() {
        file = File(object!.path);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> selectFile(BuildContext context) async {
    if (file == null) return;

    File fileName = File(file!.path);
    Uint8List imagebytes = await fileName.readAsBytes();
    String base64string = base64.encode(imagebytes);
    imgFile = "data:image/jpg;base64,$base64string";
    print('fileName:${imgFile}');
    setState(() {
      imgFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
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
                  _showDialog(context);
                },
                child: Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.add),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'name',
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: desc,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter desc';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'desc',
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: price,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter price';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'price',
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
                            MaterialStateProperty.all(Colors.green)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.addProduct(name.text, desc.text, price.text,
                            file!.path, context);
                      }
                    },
                    child: const Text('+ Add Product'),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 120,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    chooseImage(ImageSource.gallery, context);
                  },
                  leading: Icon(Icons.camera),
                  title: Text("gallery"),
                ),
                ListTile(
                  onTap: () {
                    chooseImage(ImageSource.camera, context);
                  },
                  leading: Icon(Icons.camera_alt),
                  title: Text("camera"),
                ),
              ],
            ),
          ),
          actions: [
            FlatButton(
                color: Colors.red,
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'ຍົກເລີກ',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))
          ],
        );
      },
    );
  }
}
