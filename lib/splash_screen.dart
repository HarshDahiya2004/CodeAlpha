// ignore: unused_import
import 'package:college_dost/Login_Screen.dart';
import 'package:college_dost/firebase_services/splash_services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration(seconds: 2), () {
  //     Navigator.pushReplacement(
  //       // ignore: use_build_context_synchronously
  //       context,
  //       MaterialPageRoute(builder: (context) => LoginScreen()),
  //     );
  //   });
  // }
  SplashServices splashScreen = SplashServices();
  @override
  void initState() {
    super.initState();
    splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset('assets/images/splash.png', fit: BoxFit.cover),
      ),
    );
  }
}
