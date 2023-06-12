import 'package:exam_testing/validate.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Empty Email Test', () {
    var result = TextFieldValidate.validateEmail(value: null);
    expect(result, 'Please enter Email');
  });

  test('Invalid Email Test', () {
    var result = TextFieldValidate.validateEmail(value: "");
    expect(result, 'Enter valid Email');
  });

  test('Valid Email Test', () {
    var result = TextFieldValidate.validateEmail(value: null);
    expect(result, 'Enter valid Email');
  });

  test('Valid Email Test', () {
    var result = TextFieldValidate.validateEmail(value: "abckdj@gmail.com");
    expect(result, null);
  });

  ///---------------------------------------------------------------------

  test('Empty Password Test', () {
    var result = TextFieldValidate.validatePassword(value: null);
    expect(result, 'Please enter Password');
  });

  test('Invalid Password Test', () {
    var result = TextFieldValidate.validatePassword(value: "");
    expect(result, 'Enter valid Password');
  });

  test('Valid Password Test', () {
    var result = TextFieldValidate.validatePassword(value: "abc");
    expect(result, 'Enter valid Password');
  });

  test('Valid Password Test', () {
    var result = TextFieldValidate.validatePassword(value: "Abc.1234@");
    expect(result, null);
  });
}
