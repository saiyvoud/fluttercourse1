// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void showdone(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 100,
            child: Column(
              children: const [
                CircularProgressIndicator(),
                SizedBox(
                  height: 20,
                ),
                Text('ກຳລັງໂຫລດຂໍ້ມູນ'),
              ],
            ),
          ),
        );
      });
}

void showDialogbox(context, String title) {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: Column(
        children: [
          Icon(Icons.error, color: Colors.red, size: 50),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
      children: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'ຕົກລົງ',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        )
      ],
    ),
  );
}

void showDialogSuccess(context, String title) {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: Column(
        children: [
          Icon(Icons.error, color: Colors.green, size: 50),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
      children: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'ຕົກລົງ',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        )
      ],
    ),
  );
}
