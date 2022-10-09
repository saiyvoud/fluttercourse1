import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_course/widget/widget.dart';

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
                controller: price,
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
                controller: price,
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
                  } else if (value.toString().length < 8) {
                    return 'ເບີໂທລະສັບຕ້ອງມີ 8 ຕົວເລກ';
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
                    onPressed: () {},
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
}
