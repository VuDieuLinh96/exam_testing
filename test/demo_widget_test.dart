import 'package:exam_testing/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group("widget", (){
    testWidgets('Render 2 widgets of Type TextFormField', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      var textField = find.byType(TextFormField);
      expect(textField, findsNWidgets(2));
    });

    testWidgets('Find widget by key, text', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      var passField = find.byKey(const Key('password'));
      var mailField = find.byKey(const Key('mail'));
      final textSubmit = find.text('Submit');
      expect(passField, findsOneWidget);
      expect(mailField, findsOneWidget);
      expect(textSubmit, findsOneWidget);
    });

    testWidgets('Test widget form', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      var passField = find.byKey(const Key('password'));
      var mailField = find.byKey(const Key('mail'));
      final buttonSubmit = find.text('Submit');
      expect(passField, findsOneWidget);
      expect(mailField, findsOneWidget);
      expect(buttonSubmit, findsOneWidget);

      await tester.enterText(mailField, "abc@gmail.com");
      expect(find.text("abc@gmail.com"), findsOneWidget);

      await tester.enterText(passField, "Abc@2222");
      expect(find.text("Abc@2222"), findsOneWidget);

      await tester.tap(buttonSubmit);
      await tester.pump(const Duration(milliseconds: 100));
      print('tapped');
    });
  });


}