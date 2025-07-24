import 'package:college_dost/notification_screen.dart';
import 'package:flutter/material.dart';
import 'home_2.dart';
import 'event_screen.dart';
//import 'home_screen.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  // final PageController _pageController = PageController();
  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }
  final List<Widget> _pages = [
    HomeScreen(),
    EventScreen(),
    NotificationScreen(),
    //SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  DashboardCard({required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color.withOpacity(1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 50, color: Colors.white),
            SizedBox(height: 10),
            Text(label, style: TextStyle(color: Colors.white, fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

// class EventsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Events Dashboard'),
//         backgroundColor: Colors.purple,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: GridView.count(
//           crossAxisCount: 2,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//           children: [
//             DashboardCard(
//               icon: Icons.event_available,
//               label: 'Annual Day',
//               color: Colors.deepPurple,
//             ),
//             DashboardCard(
//               icon: Icons.sports_basketball,
//               label: 'Sports Meet',
//               color: Colors.pink,
//             ),
//             DashboardCard(
//               icon: Icons.school,
//               label: 'Seminars',
//               color: Colors.teal,
//             ),
//             DashboardCard(
//               icon: Icons.theater_comedy,
//               label: 'Fests',
//               color: Colors.indigo,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
