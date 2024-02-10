import 'package:flutter/material.dart';
import 'userselect.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Redirect',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserSelectPage(), // Redirect to the SelectUser screen
    );
  }
}
