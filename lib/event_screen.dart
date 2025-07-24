import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Events',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.blue.shade400,
          toolbarHeight: 70,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: TabBar(
                  isScrollable: true,
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  indicatorColor: Colors.blue,
                  tabs: const [
                    Tab(text: 'All'),
                    Tab(text: 'Seminars'),
                    Tab(text: 'Exams'),
                    Tab(text: 'Fests'),
                    Tab(text: 'Others'),
                  ],
                ),
              ),

              // TabBar Views
              Expanded(
                child: TabBarView(
                  children: [
                    EventListTab(eventType: 'All'),
                    EventListTab(eventType: 'Seminars'),
                    EventListTab(eventType: 'Exams'),
                    EventListTab(eventType: 'Fests'),
                    EventListTab(eventType: 'Others'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EventListTab extends StatelessWidget {
  final String eventType;

  EventListTab({required this.eventType});

  final List<Map<String, String>> allEvents = [
    {
      'title': 'Annual Tech Symposium',
      'department': 'Computer Science Dept.',
      'date': 'Tomorrow, 10:00 AM',
      'color': '0xFFDDEAFE',
      'type': 'Seminars',
    },
    {
      'title': 'Mid-Term Examinations',
      'department': 'Mathematics',
      'date': 'Fri 16 Nov, 9:00 AM',
      // 'color': '0xFFD7F7DD',
      'type': 'Exams',
    },
    {
      'title': 'Cultural Fest Registration',
      'department': 'Last date to register!',
      'date': 'Today, 1:59 PM',
      'color': '0xFFF1D7F9',
      'type': 'Fests',
    },
    {
      'title': 'Other Event Example',
      'department': 'Miscellaneous',
      'date': 'Next Week',
      'color': '0xFFFFF1D7',
      'type': 'Others',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Filtered list
    final eventsToShow = eventType == 'All'
        ? allEvents
        : allEvents.where((e) => e['type'] == eventType).toList();

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: eventsToShow.length,
      itemBuilder: (context, index) {
        final event = eventsToShow[index];
        return Container(
          margin: EdgeInsets.only(bottom: 16),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(int.parse(event['color']!)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              // Placeholder Image
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(child: Text('', style: TextStyle(fontSize: 12))),
              ),
              SizedBox(width: 12),
              // Event Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event['title']!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(event['department']!),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 14,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 4),
                        Text(
                          event['date']!,
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
