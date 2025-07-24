import 'package:college_dost/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CollegeDostApp());
}

class CollegeDostApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'College Dost',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: SplashScreen(),
    );
  }
}
