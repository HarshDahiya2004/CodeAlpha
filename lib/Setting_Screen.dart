import 'package:college_dost/Login_Screen.dart';
import 'package:college_dost/privacy_policy_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme_provider.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String selectedLanguage = 'English';
  final List<String> languages = ['English', 'Hindi'];
  final auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    loadSettings();
  }

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLanguage = prefs.getString('language') ?? 'English';
    });
  }

  Future<void> updateLanguage(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', value);
    setState(() => selectedLanguage = value);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.blue.shade700,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text("General", style: sectionTitleStyle(isDark)),
          ListTile(
            title: Text("Language"),
            trailing: DropdownButton<String>(
              value: selectedLanguage,
              items: languages
                  .map(
                    (lang) => DropdownMenuItem(value: lang, child: Text(lang)),
                  )
                  .toList(),
              onChanged: (val) => updateLanguage(val!),
            ),
          ),
          SwitchListTile(
            title: Text("Dark Mode"),
            value: isDark,
            onChanged: (val) => themeProvider.toggleTheme(val),
            activeColor: Colors.blue.shade700,
          ),
          Divider(),
          Text("App Info", style: sectionTitleStyle(isDark)),
          ListTile(
            title: Text("Visit Website"),
            subtitle: Text("www.codealpha.tech"),
            trailing: Icon(Icons.open_in_new),
            onTap: () async {
              final Uri url = Uri.parse('https://www.codealpha.tech');
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Could not launch website')),
                );
              }
            },
          ),
          ListTile(
            title: Text("Privacy Policy"),
            trailing: Icon(Icons.lock_outline),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
              );
            },
          ),
          ListTile(
            title: Text("Logout"),
            trailing: Icon(Icons.logout_outlined),
            onTap: () {
              auth
                  .signOut()
                  .then((_) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  })
                  .catchError((error) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(error.toString())));
                  });
            },
          ),
          ListTile(title: Text("App Version"), subtitle: Text("1.0.0")),
        ],
      ),
    );
  }

  TextStyle sectionTitleStyle(bool isDark) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: isDark ? Colors.white : Colors.black87,
  );
}
