import 'package:flutter/material.dart';
import 'userselect.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print('Firebase initialization error: $e');
  }
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
