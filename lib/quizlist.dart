import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'quizdetails.dart';

class QuizListPage extends StatelessWidget {
  final String userId;

  QuizListPage({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('quizzes')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final List<DocumentSnapshot> quizDocuments = snapshot.data!.docs;

          if (quizDocuments.isEmpty) {
            return Center(child: Text('No quizzes available'));
          }

          return ListView.builder(
            itemCount: quizDocuments.length,
            itemBuilder: (context, index) {
              final quizNumber = index + 1;
              return ListTile(
                title: Text('Quiz $quizNumber'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizDetailsPage(
                        userId: userId,
                        quizNumber: quizNumber,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
