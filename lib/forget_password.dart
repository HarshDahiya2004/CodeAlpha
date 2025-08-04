import 'package:college_dost/utils/utils.dart';
import 'package:college_dost/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          'Forgot Password',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
            SizedBox(height: 20),

            RoundButton(
              title: 'Forgot password',
              onTap: () {
                _auth
                    .sendPasswordResetEmail(
                      email: emailController.text.toString(),
                    )
                    .then((value) {
                      Utils().ToastMessage(
                        'we have sent you an email to reset password, plese check',
                      );
                    })
                    .onError((error, stackTrace) {
                      Utils().ToastMessage(error.toString());
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
