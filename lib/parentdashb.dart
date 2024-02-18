import 'package:flutter/material.dart';
import 'package:psychalyzergpt/prntloginpage.dart';
import 'package:psychalyzergpt/chatbot.dart';
import 'quiz.dart'; // Import the QuizPage
import 'fillBlank.dart'; // Import the FillBlanksPage
import 'crossword.dart'; // Import the CrosswordGame

final Color blueViolet = Color(0xFF8A2BE2);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ParentDashboard(),
    );
  }
}

class ParentDashboard extends StatelessWidget {
  void navigateToQuiz(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizPage(),
      ),
    );
  }

  void navigateToFillBlanks(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SentenceCompletionScreen(),
      ),
    );
  }

  void navigateToCrossword(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CrosswordGame(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Psychalyzer'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => prntLoginPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Pending tests',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  height: 2,
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ListView(
                    children: <Widget>[
                      for (var i = 0; i < 3; i++)
                        Card(
                          color: blueViolet,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.black),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ListTile(
                                  leading:
                                      Icon(Icons.quiz, color: Colors.white),
                                  title: Text(
                                    'ADHD Quiz',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    width: 150,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                InformationPage(),
                                          ),
                                        );
                                      },
                                      child: Text('ADHD Information'),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    width: 150,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        navigateToQuiz(
                                            context); // Redirect to QuizPage
                                      },
                                      child: Text('Take the quiz'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Games: ",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  height: 2,
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 200,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        _buildCircularSquare(Colors.red, context),
                        _buildCircularSquare(Colors.blue, context),
                        _buildCircularSquare(Colors.green, context),
                        _buildCircularSquare(Colors.yellow, context),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatBotPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: blueViolet,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'TALK Bot',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularSquare(Color color, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (color == Colors.red) {
          navigateToFillBlanks(context); // Redirect to FillBlanksPage
        } else if (color == Colors.blue) {
          navigateToCrossword(context); // Redirect to CrosswordPage
        }
      },
      child: Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: color == Colors.red
            ? Center(
                child: Text("Fill what you feel",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white)))
            : color == Colors.blue
                ? Center(
                    child: Text(
                      "Crossword puzzle",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : null,
      ),
    );
  }
}

class InformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ADHD Information Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildSection(
                title: 'What is ADHD?',
                content:
                    'Attention-Deficit/Hyperactivity Disorder, commonly known as ADHD, is a neurodevelopmental disorder that affects both children and adults. It is characterized by persistent patterns of inattention, hyperactivity, and impulsivity that can significantly impact daily functioning.',
              ),
              _buildSection(
                title: 'Inattention Symptoms:',
                content: '• Difficulty staying focused on tasks.\n'
                    '• Frequent careless mistakes.\n'
                    '• Trouble organizing activities.\n'
                    '• Avoiding tasks requiring effort.\n'
                    '• Easily distracted.\n'
                    '• Forgetfulness in daily life.',
              ),
              _buildSection(
                title: 'Hyperactivity-Impulsivity Symptoms:',
                content: '• Fidgeting or restlessness.\n'
                    '• Inability to stay seated.\n'
                    '• Excessive talking.\n'
                    '• Interrupting others.\n'
                    '• Impatience, difficulty waiting turns.',
              ),
              _buildSection(
                title: 'Assessment:',
                content:
                    '• Clinical evaluation (symptoms, milestones, family history).\n'
                    '• Behavioral observations (school, home).\n'
                    '• Questionnaires and rating scales (teachers, parents, individual).\n'
                    '• Neuropsychological testing (attention, executive function).',
              ),
              _buildSection(
                title: 'Treatments:',
                content:
                    '• Medication : Includes stimulants (e.g., methylphenidate) or non-stimulants (e.g., atomoxetine).\n'
                    '• Educational Support : Provides academic accommodations and plans.\n'
                    '• Parent & Family Education : Teaches support strategies.\n'
                    '• Lifestyle Modifications : Routines, exercise, diet, and sleep.\n'
                    '• Individualized Approach : Tailored to the person\'s needs.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required String content}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
