import 'package:college_dost/event_screen.dart';
import 'package:college_dost/notification_screen.dart';
import 'package:college_dost/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> events = [
    {
      'title': 'Annual Tech Symposium',
      'subtitle': 'Computer Science Dept.',
      'time': 'Tomorrow, 10:00 AM',
    },
    {
      'title': 'Mid-Term Examinations',
      'subtitle': 'Mathematics',
      'time': 'Fri 16 Nov, 9:00 AM',
    },
    {
      'title': 'Cultural Fest Registration',
      'subtitle': 'Last date to register',
      'time': 'Today, 1:59 PM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
          icon: Icon(Icons.person),
          color: const Color.fromARGB(255, 57, 138, 203),
          iconSize: 30,
        ),

        title: Text(
          'Campus Dost',
          style: TextStyle(
            color: const Color.fromARGB(255, 26, 112, 183),
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Builder(
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(Icons.notifications),
                  color: const Color.fromARGB(255, 26, 112, 183),

                  onPressed: () {
                    // print("nav to notification");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationScreen(),
                      ),
                    );
                  },
                  iconSize: 25,
                ),
              );
            },
          ),
        ],
      ),

      //  backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Text("HD", style: TextStyle(color: Colors.blue)),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        "Harsh Dahiya",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Computer Science, 4rd Year",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Upcoming Events",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                // Text("View All", style: TextStyle(color: Colors.blue)),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EventScreen()),
                    );
                  },
                  child: Text('view all', style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
            SizedBox(height: 10),

            SizedBox(height: 10),

            Column(
              children: events.map((event) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.event),
                    title: Text(event['title']!),
                    subtitle: Text(event['subtitle']!),
                    trailing: Text(
                      event['time']!,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
