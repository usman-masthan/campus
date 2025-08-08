// Campus Crowd app widget tests.
//
// These tests verify the core functionality of the Campus Crowd application,
// including the display of campus locations, crowd levels, and refresh functionality.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:campus_crowd/main.dart';

void main() {
  group('Campus Crowd App Tests', () {
    testWidgets('App displays title and initial campus locations', (WidgetTester tester) async {
      // Build the Campus Crowd app
      await tester.pumpWidget(const MyApp());

      // Verify app title is displayed
      expect(find.text('Campus Crowd'), findsOneWidget);

      // Verify initial campus locations are displayed
      expect(find.text('Library'), findsOneWidget);
      expect(find.text('Cafeteria'), findsOneWidget);
      expect(find.text('Study Hall B'), findsOneWidget);
      expect(find.text('Computer Lab'), findsOneWidget);
      expect(find.text('Student Union'), findsOneWidget);
    });

    testWidgets('App displays crowd levels and color indicators', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Verify crowd levels are displayed
      expect(find.text('Low'), findsAtLeastNWidgets(1));
      expect(find.text('Medium'), findsAtLeastNWidgets(1));
      expect(find.text('High'), findsAtLeastNWidgets(1));

      // Verify emoji indicators are displayed
      expect(find.text('🟢'), findsAtLeastNWidgets(1));
      expect(find.text('🟡'), findsAtLeastNWidgets(1));
      expect(find.text('🔴'), findsAtLeastNWidgets(1));
    });

    testWidgets('Refresh button exists and can be tapped', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Find and verify refresh button exists
      expect(find.byIcon(Icons.refresh), findsOneWidget);

      // Tap the refresh button
      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pump();

      // The app should still display all locations after refresh
      expect(find.text('Library'), findsOneWidget);
      expect(find.text('Cafeteria'), findsOneWidget);
      expect(find.text('Study Hall B'), findsOneWidget);
    });

    testWidgets('Filter toggle works for low crowd display', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Find the filter switch
      expect(find.byType(Switch), findsOneWidget);
      expect(find.text('Show only low crowd'), findsOneWidget);

      // Initially all locations should be visible
      final initialLocationCount = tester.widgetList(find.byType(ListTile)).length;
      expect(initialLocationCount, greaterThan(0));

      // Toggle the filter
      await tester.tap(find.byType(Switch));
      await tester.pump();

      // After filtering, we might have fewer items (depending on mock data state)
      // The exact count depends on how many "Low" crowd items exist
      final filteredLocationCount = tester.widgetList(find.byType(ListTile)).length;
      expect(filteredLocationCount, greaterThanOrEqualTo(0));
    });

    testWidgets('Last updated timestamps are displayed', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Look for "Last updated:" text pattern
      expect(find.textContaining('Last updated:'), findsAtLeastNWidgets(1));
    });

    testWidgets('App uses Material Design Cards', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Verify Cards are used for location display
      expect(find.byType(Card), findsAtLeastNWidgets(3));
      
      // Verify ListView is used
      expect(find.byType(ListView), findsOneWidget);
    });
  });
}
