import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:exam_testing/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {

    testWidgets('submit invalid', (tester) async {
      app.main();
      var passField = find.byKey(const Key('password'));
      var mailField = find.byKey(const Key('mail'));
      final buttonSubmit = find.text('Submit');

      await tester.pumpAndSettle();
      expect(mailField, findsOneWidget);
      expect(passField, findsOneWidget);
      expect(buttonSubmit, findsOneWidget);
      await tester.enterText(mailField, "text");
      await tester.enterText(passField, "text");
      await tester.tap(buttonSubmit);
      await tester.pumpAndSettle();
    });


    testWidgets('submit invalid', (tester) async {
      app.main();
      var passField = find.byKey(const Key('password'));
      var mailField = find.byKey(const Key('mail'));
      final buttonSubmit = find.text('Submit');

      await tester.pumpAndSettle();
      expect(mailField, findsOneWidget);
      expect(passField, findsOneWidget);
      expect(buttonSubmit, findsOneWidget);
      await tester.enterText(mailField, "Abc@gmail.com");
      await tester.enterText(passField, "Abc@1234");
      await tester.tap(buttonSubmit);
      await tester.pumpAndSettle();
    });
  });
}
