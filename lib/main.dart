// import 'package:college_dost/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'splash_screen.dart';
import 'edit_profile_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: CollegeDostApp(),
    ),
  );
}

class CollegeDostApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'College Dost',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.black,
      ),
      themeMode: themeProvider.themeMode,
      home: SplashScreen(),
      routes: {'/editProfile': (context) => EditProfileScreen()},
    );
  }
}
