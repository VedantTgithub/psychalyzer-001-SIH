import 'package:flutter/material.dart';
import 'package:psychalyzergpt/parentdashb.dart';

import 'childdashb.dart';
import 'counsellordashb.dart';

class UserSelectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log-in/Register as:"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildCircularButton(context, "Child", "childlogin.dart"),
            buildCircularButton(context, "Parents", "parentlogin.dart"),
            buildCircularButton(context, "Counsellor", "counsellorlogin.dart"),
          ],
        ),
      ),
    );
  }

  Widget buildCircularButton(
      BuildContext context, String buttonText, String destinationPage) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        width: 200, // Set a fixed width
        height: 200, // Set a fixed height
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LoginPage(destinationPage)),
            );
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: EdgeInsets.all(16.0),
          ),
          child: Text(buttonText, style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  final String destinationPage;

  LoginPage(this.destinationPage);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      // Perform your login logic here
                      final String username = _emailController.text;
                      final String password = _passwordController.text;

                      // Example validation (replace with your actual logic)
                      if (username == 'test' && password == 'test') {
                        // After successful login, navigate to the respective dashboard
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              // Return the appropriate dashboard page
                              if (widget.destinationPage == 'childlogin.dart') {
                                return ChildDashboard();
                              } else if (widget.destinationPage ==
                                  'parentlogin.dart') {
                                return ParentDashboard();
                              } else if (widget.destinationPage ==
                                  'counsellorlogin.dart') {
                                return CounselDashboard();
                              } else {
                                // Return a default page or handle invalid destination
                                return ChildDashboard();
                              }
                            },
                          ),
                        );
                      } else {
                        setState(() {
                          _errorMessage =
                              'Login failed. Please check your username and password.';
                        });
                      }
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    _errorMessage,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
