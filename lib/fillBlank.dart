import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projective test 1, Comlpete the sentences',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SentenceCompletionScreen(),
    );
  }
}

class SentenceCompletionScreen extends StatefulWidget {
  @override
  _SentenceCompletionScreenState createState() =>
      _SentenceCompletionScreenState();
}

class _SentenceCompletionScreenState extends State<SentenceCompletionScreen> {
  String initialStatement = "I feel happy when...";
  String userResponse = "";

  void _saveResponse() {
    // Code to save the initial statement and user response
    // You can store it in a database or file for later analysis
    print("Initial Statement: $initialStatement");
    print("User Response: $userResponse");
    // Add code for report generation or further processing here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complete the Sentence'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              initialStatement,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                hintText: "Type your response here...",
                border: OutlineInputBorder(),
              ),
              maxLines: null, // Allow multiple lines for longer responses
              onChanged: (value) {
                userResponse = value;
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveResponse,
              child: Text('Save Response'),
            ),
          ],
        ),
      ),
    );
  }
}
