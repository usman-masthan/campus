import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _showOnlyLowCrowd = false;
  bool _notificationsEnabled = true;
  String _selectedUpdateFrequency = '15 minutes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Show Only Low Crowd Areas'),
            subtitle: const Text('Filter out medium and high crowd locations'),
            value: _showOnlyLowCrowd,
            onChanged: (bool value) {
              setState(() {
                _showOnlyLowCrowd = value;
              });
            },
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Crowd Alerts'),
            subtitle: const Text('Receive notifications about crowd changes'),
            value: _notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),
          ListTile(
            title: const Text('Update Frequency'),
            subtitle: Text(_selectedUpdateFrequency),
            trailing: DropdownButton<String>(
              value: _selectedUpdateFrequency,
              items: <String>[
                '5 minutes',
                '15 minutes',
                '30 minutes',
                '1 hour',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedUpdateFrequency = newValue;
                  });
                }
              },
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('About Campus Crowd'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // TODO: Show about dialog
            },
          ),
        ],
      ),
    );
  }
}