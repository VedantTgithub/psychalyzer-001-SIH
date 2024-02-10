import 'package:flutter/material.dart';

class GuidancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guidance Page'),
      ),
      body: SingleChildScrollView(
        // Enable vertical scrolling
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Guidance for ADHD',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              // Add guidance content here
              Text(
                'If you suspect that your child may have ADHD, it is important to seek professional advice and assessment.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Here are some steps to consider:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              // Add a list of guidance steps here
              ListTile(
                leading: Icon(Icons.check),
                title: Text(
                    'Consult a pediatrician or child psychologist for an evaluation.'),
              ),
              ListTile(
                leading: Icon(Icons.check),
                title: Text(
                    'Discuss your concerns with your child\'s school and teachers.'),
              ),
              ListTile(
                leading: Icon(Icons.check),
                title: Text('Explore therapy and behavioral interventions.'),
              ),
              SizedBox(height: 20),
              Text(
                'Contact Our ADHD Counselors:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              // Add contact cards for counselors here
              _buildContactCard(
                name: 'Dr. John Doe',
                imageUrl: 'assets/john_doe.jpg',
                phoneNumber: '+1234567890',
                email: 'john.doe@example.com',
              ),
              _buildContactCard(
                name: 'Dr. Jane Smith',
                imageUrl: 'assets/jane_smith.jpg',
                phoneNumber: '+9876543210',
                email: 'jane.smith@example.com',
              ),
              _buildContactCard(
                name: 'Dr. David Johnson',
                imageUrl: 'assets/david_johnson.jpg',
                phoneNumber: '+1122334455',
                email: 'david.johnson@example.com',
              ),
              _buildContactCard(
                name: 'Dr. Sarah Brown',
                imageUrl: 'assets/sarah_brown.jpg',
                phoneNumber: '+9988776655',
                email: 'sarah.brown@example.com',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add functionality to navigate back to the dashboard or another page
                  Navigator.pop(context);
                },
                child: Text('Back to Dashboard'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactCard(
      {required String name,
      required String imageUrl,
      required String phoneNumber,
      required String email}) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imageUrl),
              radius: 50,
            ),
            SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text('Phone: $phoneNumber'),
            Text('Email: $email'),
          ],
        ),
      ),
    );
  }
}
