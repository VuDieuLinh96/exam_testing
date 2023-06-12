import 'package:exam_testing/validate.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController? _mailController;
  TextEditingController? _passController;
  String? _mail;
  String? _password;

  @override
  void initState() {
    _mailController = TextEditingController();
    _passController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Testing Flutter"),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormField(
                    key: const Key('mail'),
                    controller: _mailController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.mail),
                      hintText: 'Enter your mail',
                      labelText: 'Mail',
                    ),
                    onSaved: (value) => _mail = value!.trim(),
                    validator:(value) => TextFieldValidate.validateEmail(value: value),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    key: const Key('password'),
                    controller: _passController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.password),
                      hintText: 'Enter your password',
                      labelText: 'Password',
                    ),
                    onSaved: (value) => _password = value!.trim(),
                    validator:(value) => TextFieldValidate.validatePassword(value: value),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      color: Colors.lightBlueAccent,
                      child: InkWell(
                        child: const Text('Submit'),
                        onTap:submit,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void submit() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }


  @override
  void dispose() {
    super.dispose();
  }
}
