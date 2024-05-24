import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flower/main.dart'; // Adjust the path as necessary.

void main() {
  testWidgets('MyApp widget test', (WidgetTester tester) async {
 
    await tester.pumpWidget(
      MaterialApp(home: MyApp()),
    );

    
    expect(find.byWidget(MyApp()), findsOneWidget);
  });
}
