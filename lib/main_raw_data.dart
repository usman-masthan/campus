/// Alternative implementation using raw Map data as specified in requirements
/// 
/// This version demonstrates the exact data structure requested in the problem statement
/// while maintaining the same functionality as the class-based approach in main.dart

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Crowd',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CampusCrowdHomePage(title: 'Campus Crowd'),
    );
  }
}

class CampusCrowdHomePage extends StatefulWidget {
  const CampusCrowdHomePage({super.key, required this.title});

  final String title;

  @override
  State<CampusCrowdHomePage> createState() => _CampusCrowdHomePageState();
}

class _CampusCrowdHomePageState extends State<CampusCrowdHomePage> {
  /// Raw crowd data exactly as specified in the requirements
  List<Map<String, String>> crowdData = [
    {
      'name': 'Library',
      'population': 'Low',
      'color': 'green',
      'lastUpdated': '10:30 AM'
    },
    {
      'name': 'Cafeteria',
      'population': 'High',
      'color': 'red',
      'lastUpdated': '10:32 AM'
    },
    {
      'name': 'Study Hall B',
      'population': 'Medium',
      'color': 'yellow',
      'lastUpdated': '10:29 AM'
    }
  ];

  bool _showOnlyLowCrowd = false;

  /// Refresh data with random crowd levels using raw Map format
  void _refreshData() {
    final random = Random();
    final populations = ['Low', 'Medium', 'High'];
    final colors = ['green', 'yellow', 'red'];
    final now = DateTime.now();
    final currentTime = "${now.hour}:${now.minute.toString().padLeft(2, '0')} ${now.hour >= 12 ? 'PM' : 'AM'}";

    setState(() {
      for (var i = 0; i < crowdData.length; i++) {
        final randomIndex = random.nextInt(3);
        crowdData[i] = {
          'name': crowdData[i]['name']!,
          'population': populations[randomIndex],
          'color': colors[randomIndex],
          'lastUpdated': currentTime,
        };
      }
    });
  }

  Color _getColor(String colorName) {
    switch (colorName) {
      case 'green':
        return Colors.green;
      case 'yellow':
        return Colors.yellow;
      case 'red':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getEmoji(String colorName) {
    switch (colorName) {
      case 'green':
        return '🟢';
      case 'yellow':
        return '🟡';
      case 'red':
        return '🔴';
      default:
        return '⚪';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Filter data if needed
    final displayData = _showOnlyLowCrowd 
        ? crowdData.where((item) => item['population'] == 'Low').toList()
        : crowdData;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          Switch(
            value: _showOnlyLowCrowd,
            onChanged: (value) {
              setState(() {
                _showOnlyLowCrowd = value;
              });
            },
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Text('Show only low crowd'),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: displayData.length,
              itemBuilder: (context, index) {
                final item = displayData[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ListTile(
                    leading: Text(
                      _getEmoji(item['color']!),
                      style: const TextStyle(fontSize: 24),
                    ),
                    title: Text(
                      item['name']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Last updated: ${item['lastUpdated']}'),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                      decoration: BoxDecoration(
                        color: _getColor(item['color']!).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(color: _getColor(item['color']!)),
                      ),
                      child: Text(
                        item['population']!,
                        style: TextStyle(
                          color: _getColor(item['color']!),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshData,
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}