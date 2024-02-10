import 'package:flutter/material.dart';

class ChildTest extends StatelessWidget {
  final String quizName;

  ChildTest({required this.quizName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz: $quizName'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Quiz: $quizName',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add quiz logic here
              },
              child: Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
