//import 'package:flutter/cupertino.dart';

import 'dart:async';

import 'package:college_dost/Login_Screen.dart';
import 'package:college_dost/dashboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/src/widgets/framework.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        ),
      );
    } else {
      Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        ),
      );
    }
  }
}
