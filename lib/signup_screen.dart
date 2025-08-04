//import 'package:college_dost/dashboard_screen.dart';
import 'package:college_dost/Login_Screen.dart';
import 'package:college_dost/utils/utils.dart';
// import 'package:college_dost/dashboard_screen.dart';
// import 'package:college_dost/signup_screen.dart';
import 'package:college_dost/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Sign Up',
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
                      hintText: ' Create Passward',
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
              title: 'Sign Up',
              loading: loading,
              onTap: () {
                if (_formkey.currentState!.validate()) {
                  setState(() {
                    loading = true;
                  });
                  _auth
                      .createUserWithEmailAndPassword(
                        email: emailController.text.toString(),
                        password: passwardController.text.toString(),
                      )
                      .then((value) {
                        setState(() {
                          loading = false;
                        });
                      })
                      .onError((error, StackTrace) {
                        Utils().ToastMessage(error.toString());
                        setState(() {
                          loading = true;
                        });
                      });
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
