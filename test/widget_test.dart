import 'package:choretl/screens/chore_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:choretl/main.dart';

void main() {
  group('ChoreApp Tests', () {
    testWidgets('App should build its widget tree without any issues',
        (WidgetTester tester) async {
      await tester.pumpWidget(const ChoreApp());

      expect(find.byType(MaterialApp), findsOneWidget);
      expect(find.byType(ChorePage), findsOneWidget);
    });

    testWidgets('Adding a new chore should update the list',
        (WidgetTester tester) async {
      await tester.pumpWidget(const ChoreApp());

      // Simulate adding a chore
      await tester
          .tap(find.byIcon(Icons.add)); // assuming the FAB works perfectly
      await tester.pumpAndSettle(); // Wait for the new page to open

      // Simulate entering information in the AddChorePage
      await tester.enterText(find.byType(TextField).first, 'Test Chore');
      await tester.enterText(find.byType(TextField).last, 'Test Description');
      await tester.tap(find.text('Save Chore'));
      await tester
          .pumpAndSettle(); // Wait for the new chore to be added and the page to pop

      // Verify the chore has been added
      expect(find.text('Test Chore'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
    });
  });
}
