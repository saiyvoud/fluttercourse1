// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_brace_in_string_interps, avoid_print, deprecated_member_use

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'package:flutter_course/model/product_model.dart';

import 'package:image_picker/image_picker.dart';

class Detail extends StatefulWidget {
  final Product product;
  const Detail({Key? key, required this.product}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final desc = TextEditingController();
  final price = TextEditingController();
  int id = 0;

  String? imgFile;
  File? file;
  Product? product;
  @override
  void initState() {
    super.initState();
    product = widget.product;
  }

  Future chooseImage(ImageSource imageSource, BuildContext context) async {
    try {
      var object = await ImagePicker().getImage(
        source: imageSource,
      );
      setState(() {
        file = File(object!.path);
        selectFile(context);
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
    name.text = product!.name;
    desc.text = product!.description;
    price.text = product!.price;
    imgFile = product!.image;
    id = product!.id;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Product'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Form(
          key: _formKey,
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
                      child: file == null
                          ? Image.network(
                              product!.image,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              file!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    // initialValue: widget.product.name,
                    controller: name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'name is require';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'name',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    // initialValue: widget.product.price,
                    controller: desc,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'desc is require';
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
                        return 'price is require';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'price',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Container(
                          height: 50,
                          width: 160,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.orange)),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {}
                            },
                            child: const Text('Update Product'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Container(
                          height: 50,
                          width: 160,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red)),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {}
                            },
                            child: const Text('Delete Product'),
                          ),
                        ),
                      ),
                    ],
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
                onPressed: () {},
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
