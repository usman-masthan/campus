import '../models/crowd_data.dart';

class CrowdService {
  static final List<Map<String, String>> _mockData = [
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
    },
  ];

  List<CrowdData> getCrowdData() {
    return _mockData.map((data) => CrowdData.fromMap(data)).toList();
  }

  Future<List<CrowdData>> refreshCrowdData() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Simulate random updates to timestamps
    final now = DateTime.now();
    final updatedData = _mockData.map((data) {
      return {
        ...data,
        'lastUpdated': '${now.hour}:${now.minute.toString().padLeft(2, '0')} ${now.hour >= 12 ? 'PM' : 'AM'}'
      };
    }).toList();

    return updatedData.map((data) => CrowdData.fromMap(data)).toList();
  }
}