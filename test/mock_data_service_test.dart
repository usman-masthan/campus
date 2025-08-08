// Tests for the MockDataService
//
// These tests verify the mock data service functionality including
// data retrieval, refresh operations, and filtering.

import 'package:flutter_test/flutter_test.dart';
import 'package:campus_crowd/mock_data_service.dart';

void main() {
  group('MockDataService Tests', () {
    test('getCrowdData returns initial data', () {
      final data = MockDataService.getCrowdData();
      
      expect(data.length, 5);
      expect(data[0]['name'], 'Library');
      expect(data[1]['name'], 'Cafeteria');
      expect(data[2]['name'], 'Study Hall B');
      expect(data[3]['name'], 'Computer Lab');
      expect(data[4]['name'], 'Student Union');
    });

    test('refreshCrowdData updates crowd levels and timestamps', () {
      final initialData = MockDataService.getCrowdData();
      final refreshedData = MockDataService.refreshCrowdData();
      
      expect(refreshedData.length, initialData.length);
      
      // Verify all location names are preserved
      for (int i = 0; i < initialData.length; i++) {
        expect(refreshedData[i]['name'], initialData[i]['name']);
      }
      
      // Verify that each item has valid crowd data
      for (final item in refreshedData) {
        expect(item['population'], isIn(['Low', 'Medium', 'High']));
        expect(item['color'], isIn(['green', 'yellow', 'red']));
        expect(item['lastUpdated'], isNotEmpty);
      }
    });

    test('getLowCrowdData filters correctly', () {
      // First refresh to ensure we have varied data
      MockDataService.refreshCrowdData();
      final lowCrowdData = MockDataService.getLowCrowdData();
      
      // Verify all returned items have 'Low' population
      for (final item in lowCrowdData) {
        expect(item['population'], 'Low');
        expect(item['color'], 'green');
      }
      
      // Verify length is appropriate (0 to total locations)
      expect(lowCrowdData.length, greaterThanOrEqualTo(0));
      expect(lowCrowdData.length, lessThanOrEqualTo(5));
    });

    test('data structure matches requirements specification', () {
      final data = MockDataService.getCrowdData();
      
      for (final item in data) {
        // Verify all required keys exist
        expect(item.containsKey('name'), true);
        expect(item.containsKey('population'), true);
        expect(item.containsKey('color'), true);
        expect(item.containsKey('lastUpdated'), true);
        
        // Verify value types are String as specified
        expect(item['name'], isA<String>());
        expect(item['population'], isA<String>());
        expect(item['color'], isA<String>());
        expect(item['lastUpdated'], isA<String>());
        
        // Verify values are within expected ranges
        expect(item['population'], isIn(['Low', 'Medium', 'High']));
        expect(item['color'], isIn(['green', 'yellow', 'red']));
      }
    });

    test('initial data contains exactly specified locations', () {
      final data = MockDataService.getCrowdData();
      
      // Check that the three locations from requirements are present
      final libraryItem = data.firstWhere((item) => item['name'] == 'Library');
      final cafeteriaItem = data.firstWhere((item) => item['name'] == 'Cafeteria');
      final studyHallItem = data.firstWhere((item) => item['name'] == 'Study Hall B');
      
      expect(libraryItem['population'], 'Low');
      expect(libraryItem['color'], 'green');
      expect(libraryItem['lastUpdated'], '10:30 AM');
      
      expect(cafeteriaItem['population'], 'High');
      expect(cafeteriaItem['color'], 'red');
      expect(cafeteriaItem['lastUpdated'], '10:32 AM');
      
      expect(studyHallItem['population'], 'Medium');
      expect(studyHallItem['color'], 'yellow');
      expect(studyHallItem['lastUpdated'], '10:29 AM');
    });
  });
}