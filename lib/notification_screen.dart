// import 'package:flutter/material.dart';

// class NotificationScreen extends StatefulWidget {
//   @override
//   State<NotificationScreen> createState() => _NotificationScreenState();
// }

// class _NotificationScreenState extends State<NotificationScreen> {
//    const NotificationScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Notifications',
//           style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
//         ),
//         backgroundColor: Colors.blue.shade400,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Container(
//           child: Row(
//             children: [
//               Text('Annual Tech Symposium', selectionColor: Colors.white),
//             ],
//           ),
//           color: Colors.lightGreenAccent,
//         ),
//       ),

//     );
//   }
// }
import 'package:college_dost/notification_settings_screen.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'title': 'New Seminar Added',
      'subtitle': 'AI in Education - 26 July, 11:00 AM',
      'category': 'Events',
    },
    {
      'title': 'Exam Schedule Updated',
      'subtitle': 'Mid Term - CS301 moved to 30 July',
      'category': 'Exams',
    },
    {
      'title': 'Important Announcement',
      'subtitle': 'College will remain closed on 28 July (Sunday)',
      'category': 'Announcements',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue.shade400,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationSettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: buildNotificationList(context, notifications),
    );
  }

  Widget buildNotificationList(
    BuildContext context,
    List<Map<String, String>> data,
  ) {
    if (data.isEmpty) {
      return Center(child: Text("No notifications available."));
    }

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final notification = data[index];
        return InkWell(
          onTap: () {
            // Action on notification tap
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text(notification['title'] ?? ''),
                content: Text(
                  "You tapped this notification.\n\n"
                  "${notification['subtitle']}",
                ),
                actions: [
                  TextButton(
                    child: Text('OK'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            );
          },
          child: Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Icon(Icons.notifications, color: Colors.blue.shade300),
              title: Text(
                notification['title'] ?? '',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(notification['subtitle'] ?? ''),
            ),
          ),
        );
      },
    );
  }
}
