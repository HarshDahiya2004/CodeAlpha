import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatefulWidget {
  @override
  _NotificationSettingsScreenState createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool pushNotifications = true;
  bool sound = true;
  bool vibration = true;
  bool doNotDisturb = false;
  bool preview = true;

  TimeOfDay? dndStartTime;
  TimeOfDay? dndEndTime;

  String selectedTone = 'Default';
  List<String> tones = ['Default', 'Chime', 'Alert', 'Soft Bell'];

  Future<void> pickTime(BuildContext context, bool isStart) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        if (isStart) {
          dndStartTime = pickedTime;
        } else {
          dndEndTime = pickedTime;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.blue.shade700,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          buildSwitchTile(
            'Push notifications',
            pushNotifications,
            (val) => setState(() => pushNotifications = val),
          ),
          buildSwitchTile('Sound', sound, (val) => setState(() => sound = val)),
          buildSwitchTile(
            'Vibration',
            vibration,
            (val) => setState(() => vibration = val),
          ),
          buildSwitchTile(
            'Do Not Disturb',
            doNotDisturb,
            (val) => setState(() => doNotDisturb = val),
          ),
          if (doNotDisturb) ...[
            ListTile(
              title: Text('DND Start Time'),
              subtitle: Text(dndStartTime?.format(context) ?? 'Not Set'),
              trailing: Icon(Icons.timer),
              onTap: () => pickTime(context, true),
            ),
            ListTile(
              title: Text('DND End Time'),
              subtitle: Text(dndEndTime?.format(context) ?? 'Not Set'),
              trailing: Icon(Icons.timer_off),
              onTap: () => pickTime(context, false),
            ),
          ],
          buildSwitchTile(
            'Notification preview',
            preview,
            (val) => setState(() => preview = val),
          ),
          SizedBox(height: 20),
          ListTile(
            title: Text('Notification Tone'),
            trailing: DropdownButton<String>(
              value: selectedTone,
              items: tones
                  .map(
                    (tone) => DropdownMenuItem(value: tone, child: Text(tone)),
                  )
                  .toList(),
              onChanged: (val) => setState(() => selectedTone = val!),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSwitchTile(String title, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      activeColor: Colors.blue.shade700,
      onChanged: onChanged,
    );
  }
}
