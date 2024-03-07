import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              // User is logged in
              User? user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                return ClientList(user: user);
              } else {
                // User is not logged in
                return LoginPage();
              }
            } else {
              // User is not logged in
              return LoginPage();
            }
          }
        },
      ),
    );
  }
}

class ClientList extends StatelessWidget {
  final User user;

  ClientList({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Client List'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future:
            FirebaseFirestore.instance.collection('users').doc(user.uid).get(),
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final userFamilyCode = userSnapshot.data?['familyCode'];

          return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;

              return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  final document = documents[index];
                  final data = document.data() as Map<String, dynamic>;
                  final role = data['role'];

                  // Only show details of parents and children
                  if (role == 'Parent' || role == 'Child') {
                    final familyCode = data['familyCode'];

                    // Check if family code matches with logged-in user's family code
                    if (familyCode == userFamilyCode) {
                      return Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(20),
                          leading: CircleAvatar(
                            child:
                                Text('${index + 1}'), // Display client number
                          ),
                          title:
                              Text(data['name'] ?? ''), // Display client name
                          subtitle:
                              Text(data['email'] ?? ''), // Display client email
                          onTap: () {
                            // Handle onTap event for each client
                            // For example, navigate to client details page
                          },
                        ),
                      );
                    }
                  }
                  return SizedBox(); // Return an empty SizedBox for other roles or unmatched family code
                },
              );
            },
          );
        },
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Your login page implementation
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Text('Login Page'),
      ),
    );
  }
}
