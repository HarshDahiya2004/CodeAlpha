import 'package:college_dost/dashboard_screen.dart';
import 'package:college_dost/forget_password.dart';
//import 'package:college_dost/home_2.dart';
import 'package:college_dost/signup_screen.dart';
import 'package:college_dost/utils/utils.dart';
import 'package:college_dost/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwardController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwardController.dispose();
  }

  void login() {
    setState(() {
      loading = true;
    });

    _auth
        .signInWithEmailAndPassword(
          email: emailController.text,
          password: passwardController.text.toString(),
        )
        .then((value) {
          Utils().ToastMessage(value.user!.email.toString());
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
          );
          setState(() {
            loading = false;
          });
        })
        .onError((error, stackTrace) {
          Utils().ToastMessage(error.toString());
          debugPrint(error.toString());
          setState(() {
            loading = false;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 19, 130, 220),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Email';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 10),

                    TextFormField(
                      controller: passwardController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Passward',
                        prefixIcon: Icon(Icons.password),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Passward';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              RoundButton(
                title: 'Login',
                loading: loading,
                onTap: () {
                  if (_formkey.currentState!.validate()) {
                    login();
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: Text('Forget Password'),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("don't have an account"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: Text('sign up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
