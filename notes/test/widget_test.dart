// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:notes/main.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    Database database = await _initDatabase();
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(database: database));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

Future<Database> _initDatabase() async {
  var databasePath = await getDatabasesPath();
  print('Database Path: $databasePath');
  String path = join(databasePath, 'notes_database.db');
  print('Path: $path');

  Database database = await openDatabase(
    path,
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE notes(id INTEGER PRIMARY KEY, note TEXT)',
      );
    },
    version: 1,
  );
  return database;
}