import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'client_details.dart';
import 'loginpage.dart'; // Import the LoginPage class

class ClientList extends StatelessWidget {
  final User user;

  ClientList({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Client List'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              try {
                await FirebaseAuth.instance.signOut();
                // Navigate to the LoginPage and remove all routes below it
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false,
                );
              } catch (e) {
                // Handle logout error
                print('Logout error: $e');
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Logout Error'),
                      content: Text('An error occurred during logout.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Close the alert dialog
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
          ),
        ],
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
                      final userId = document.id; // Get userId from document

                      return GestureDetector(
                        onTap: () {
                          // Navigate to client details page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ClientDetailsPage(
                                clientData: data,
                                userId: userId, // Pass userId here
                              ),
                            ),
                          );
                        },
                        child: Card(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
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
                            subtitle: Text(
                                data['email'] ?? ''), // Display client email
                          ),
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
