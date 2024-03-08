import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuizDetailsPage extends StatelessWidget {
  final String userId;
  final int quizNumber;

  QuizDetailsPage({required this.userId, required this.quizNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz $quizNumber Details'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('quizzes')
            .doc('49KDlD7K6ktxraC19Wf5')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final Map<String, dynamic>? quizData =
              snapshot.data?.data() as Map<String, dynamic>?;

          if (quizData == null) {
            return Center(child: Text('No data available'));
          }

          final List<Map<String, dynamic>> quizResponses =
              List<Map<String, dynamic>>.from(quizData['quiz_responses']);

          if (quizResponses.isEmpty) {
            return Center(child: Text('No quiz responses available'));
          }

          return ListView.builder(
            itemCount: quizResponses.length,
            itemBuilder: (context, index) {
              final response = quizResponses[index];
              final question = response['question'];
              final userAnswer = response['user_answer'];

              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text('Question: $question'),
                  subtitle: Text('User Answer: $userAnswer'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
