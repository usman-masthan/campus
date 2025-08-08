/// Mock Data Service for Campus Crowd Application
/// 
/// This file demonstrates the exact data format specified in the requirements
/// and provides a service layer for managing crowd data updates.

import 'dart:math';

class MockDataService {
  /// Raw crowd data as specified in the requirements
  /// This demonstrates the exact format requested:
  /// - name: String (location name)  
  /// - population: String (Low, Medium, High)
  /// - color: String (green, yellow, red)
  /// - lastUpdated: String (time format)
  static final List<Map<String, String>> _initialCrowdData = [
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

  /// Extended mock data with additional campus locations
  static List<Map<String, String>> _crowdData = [
    ..._initialCrowdData,
    {
      'name': 'Computer Lab',
      'population': 'Low',
      'color': 'green',
      'lastUpdated': '10:35 AM'
    },
    {
      'name': 'Student Union',
      'population': 'Medium',
      'color': 'yellow',
      'lastUpdated': '10:28 AM'
    }
  ];

  /// Gets the current crowd data
  static List<Map<String, String>> getCrowdData() {
    return List.from(_crowdData);
  }

  /// Simulates refreshing crowd data with random updates
  static List<Map<String, String>> refreshCrowdData() {
    final random = Random();
    final populations = ['Low', 'Medium', 'High'];
    final colors = ['green', 'yellow', 'red'];
    final now = DateTime.now();
    final currentTime = "${now.hour}:${now.minute.toString().padLeft(2, '0')} ${now.hour >= 12 ? 'PM' : 'AM'}";

    for (var i = 0; i < _crowdData.length; i++) {
      final randomIndex = random.nextInt(3);
      _crowdData[i] = {
        'name': _crowdData[i]['name']!,
        'population': populations[randomIndex],
        'color': colors[randomIndex],
        'lastUpdated': currentTime,
      };
    }

    return List.from(_crowdData);
  }

  /// Filters data to show only low crowd locations
  static List<Map<String, String>> getLowCrowdData() {
    return _crowdData.where((item) => item['population'] == 'Low').toList();
  }
}