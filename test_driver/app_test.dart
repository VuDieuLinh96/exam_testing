import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('flutter form app', () {
    late FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() {
      if (driver != null) {
        driver!.close();
      }
    });

     var passField = find.byValueKey('password');
     var mailField = find.byValueKey('mail');
     final buttonSubmit = find.text('Submit');

     test("Submit  invalid", () async {
       await driver!.tap(mailField);
       await driver!.enterText("abc");

       await driver!.tap(passField);
       await driver!.enterText("Abc");

       await driver!.tap(buttonSubmit);
     });

    test("Submit  valid", () async {
      await driver!.tap(mailField);
      await driver!.enterText("abc@gmail.com");

      await driver!.tap(passField);
      await driver!.enterText("Abc@1234");

      await driver!.tap(buttonSubmit);
    });
  });
}
