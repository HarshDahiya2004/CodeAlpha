import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "Harsh Dahiya";
  String email = "harshdahiya3110@gmail.com";
  String phone = "+91 7404259072";
  String course = "Computer Science";
  String year = "4th Year";

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        backgroundColor: Colors.blue.shade400,
        actions: [
          Switch(
            value: isDark,
            onChanged: (val) {
              Provider.of<ThemeProvider>(
                context,
                listen: false,
              ).toggleTheme(val);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            profileCard(),
            infoCard(Icons.email, "Email", email),
            infoCard(Icons.phone, "Phone", phone),
            infoCard(Icons.school, "Course", course),
            infoCard(Icons.calendar_today, "Year", year),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () async {
                final updated =
                    await Navigator.pushNamed(
                          context,
                          '/editProfile',
                          arguments: {
                            'name': name,
                            'Email': email,
                            'phone': phone,
                            'course': course,
                            'year': year,
                          },
                        )
                        as Map<String, String>?;

                if (updated != null) {
                  setState(() {
                    name = updated['name']!;
                    phone = updated['phone']!;
                    course = updated['course']!;
                    year = updated['year']!;
                  });
                }
              },
              icon: Icon(Icons.edit),
              label: Text("Edit Profile"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade400,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget profileCard() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          CircleAvatar(radius: 45, child: Icon(Icons.person, size: 45)),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text('$course, $year'),
        ],
      ),
    );
  }

  Widget infoCard(IconData icon, String title, String value) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue.shade400),
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }
}
