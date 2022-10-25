// ignore_for_file: prefer_const_constructors, avoid_print, unused_field, unused_element, use_build_context_synchronously, unnecessary_null_comparison

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/widget.dart';

class OTPPage extends StatefulWidget {
  final String phone;
  final String firstName; 
  final String lastName;
  final String password;
  const OTPPage(
      {Key? key,
      required this.phone,
      required this.firstName,
      required this.lastName,
      required this.password})
      : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  String _verificationId = '';
  bool showLoading = false;
  int start = 0;
  final code = TextEditingController();
  @override
  void initState() {
    super.initState();
    _handleOTP();
  }

  startTime() {
    setState(() {
      start = 60;
    });
    var second = Duration(seconds: 1);
    Timer.periodic(second, (timer) {
      if (start == 0) {
        if (mounted) {
          setState(() {
            timer.cancel();
          });
        }
      } else {
        if (mounted) {
          setState(() {
            start--;
          });
        }
      }
    });
  }

  _handleOTP() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      timeout: Duration(seconds: 60),
      phoneNumber: '+85620${widget.phone}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        print('success:$credential');
        if (mounted) {
          setState(() {
            showLoading = true;
          });
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }

        // Handle other errors
      },
      codeSent: (String verificationId, int? resendToken) async {
        if (mounted) {
          setState(() {
            _verificationId = verificationId;
            startTime();

            showLoading = true;
          });
        }
      },
      codeAutoRetrievalTimeout: (String verificationId) async {
        // Auto-resolution timed out...
      },
    );
  }

  authOTP(PhoneAuthCredential phoneAuthCredential) async {
    try {
      final authOTP =
          await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
      if (authOTP.user != null) {
        // Get.back();

      } else {
        showDialogbox(context, "OTP ບໍ່ສຳເລັດ");
      }
    } on Exception catch (e) {
      print('error$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP'),
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
            Text('Verification'),
            Text('ເບີໂທລະສັບຂອງທ່ານ +85620${widget.phone}'),
            TextFormField(
              controller: code,
              decoration: InputDecoration(hintText: 'otp 6 ຕົວ'),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_verificationId == null || _verificationId == "") {
                  } else {
                    final phoneAuthCredential = PhoneAuthProvider.credential(
                        verificationId: _verificationId, smsCode: code.text);
                    print('phoneAuthCredential:$phoneAuthCredential');
                    showdone(context);
                    authOTP(phoneAuthCredential);
                  }
                },
                child: Text('verification')),
            showLoading == false
                ? CircularProgressIndicator()
                : InkWell(
                    onTap: () {
                      if (start == 0) {
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      'ສົ່ງຄືນ>0:$start',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ),
          ],
        ),
      )),
    );
  }
}
