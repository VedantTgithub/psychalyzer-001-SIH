import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'quizlist.dart';
// ignore: unused_import;;
import 'quizdetails.dart';

class ClientDetailsPage extends StatelessWidget {
  final Map<String, dynamic> clientData;
  final String userId;

  ClientDetailsPage({required this.clientData, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Client Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Client Actions:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Quiz Responses',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizListPage(userId: userId),
                    ),
                  );
                },
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Games Played',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  // Handle tap on Games Played card
                },
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Report',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  // Handle tap on Report card
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
