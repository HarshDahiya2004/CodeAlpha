import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Text('''
Campus Dost respects your privacy and is committed to protecting any personal information you share with us.

We do not collect, store, or share any personal data.

The app only uses notification permissions to alert students about:
- Seminars
- Exams
- Fests
- Important Notices

No other permissions are used or stored.

For more information, contact us at: contact@codealpha.tech
            ''', style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
