// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
//
// import 'guidance.dart';
//
// class ReportsPage extends StatelessWidget {
//   final List<String?> responses;
//   final int totalScore;
//
//   ReportsPage({required this.responses, required this.totalScore});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Assessment Report'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: 300, // Set a fixed height for the chart
//                 child: LineChart(
//                   LineChartData(
//                     gridData: FlGridData(show: false),
//                     titlesData: FlTitlesData(show: false),
//                     borderData: FlBorderData(
//                       show: true,
//                       border: Border.all(
//                         color: const Color(0xff37434d),
//                         width: 1,
//                       ),
//                     ),
//                     minX: 0,
//                     maxX: responses.length.toDouble() - 1,
//                     minY: 0,
//                     maxY: 4,
//                     lineBarsData: [
//                       LineChartBarData(
//                         spots: _generateChartData(responses),
//                         isCurved: true,
//                         colors: [Colors.blue],
//                         dotData: FlDotData(show: false),
//                         belowBarData: BarAreaData(show: false),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Text(
//                 'Question num vs responses graph',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.blue.withOpacity(0.2),
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Following Author's questionnaire's and analysis techniques, we have generated the results for the assessment:",
//                       style: TextStyle(fontSize: 18),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       totalScore <= 21
//                           ? "Child is not suffering from ADHD"
//                           : "Child may be suffering from ADHD. We request you to opt for further guidance",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text('Your test score is $totalScore'),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Implement the navigation to the GuidancePage
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => GuidancePage(),
//                     ),
//                   );
//                 },
//                 child: Text('Further Guidance'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<FlSpot> _generateChartData(List<String?> responses) {
//     List<FlSpot> spots = [];
//
//     for (int i = 0; i < responses.length; i++) {
//       int score = _responseToScore(responses[i]);
//
//       if (score >= 1 && score <= 4) {
//         spots.add(FlSpot(i.toDouble(), score.toDouble()));
//       } else {
//         // Handle invalid data (e.g., show an error message)
//         print('Invalid response at index $i: ${responses[i]}');
//       }
//     }
//
//     return spots;
//   }
//
//   int _responseToScore(String? response) {
//     // Implement your logic to map responses to scores
//     // Example:
//     if (response == 'Very Often') {
//       return 4;
//     } else if (response == 'Often') {
//       return 3;
//     } else if (response == 'Sometimes') {
//       return 2;
//     } else if (response == 'Not Really') {
//       return 1;
//     } else {
//       // Handle any other cases or invalid responses
//       return 0;
//     }
//   }
// }
//




import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import 'dart:typed_data';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import 'guidance.dart';

class ReportsPage extends StatelessWidget {
  final List<String?> responses;
  final int totalScore;

  ReportsPage({required this.responses, required this.totalScore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assessment Report'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(
                        color: const Color(0xff37434d),
                        width: 1,
                      ),
                    ),
                    minX: 0,
                    maxX: responses.length.toDouble() - 1,
                    minY: 0,
                    maxY: 4,
                    lineBarsData: [
                      LineChartBarData(
                        spots: _generateChartData(responses),
                        isCurved: true,
                        colors: [Colors.blue],
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                'Question num vs responses graph',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Following Author's questionnaire's and analysis techniques, we have generated the results for the assessment:",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Text(
                      totalScore <= 21
                          ? "Child is not suffering from ADHD"
                          : "Child may be suffering from ADHD. We request you to opt for further guidance",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text('Your test score is $totalScore'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _saveAsPdf(context);
                },
                child: Text('Save as PDF'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<FlSpot> _generateChartData(List<String?> responses) {
    List<FlSpot> spots = [];

    for (int i = 0; i < responses.length; i++) {
      int score = _responseToScore(responses[i]);

      if (score >= 1 && score <= 4) {
        spots.add(FlSpot(i.toDouble(), score.toDouble()));
      } else {
        print('Invalid response at index $i: ${responses[i]}');
      }
    }

    return spots;
  }

  int _responseToScore(String? response) {
    if (response == 'Very Often') {
      return 4;
    } else if (response == 'Often') {
      return 3;
    } else if (response == 'Sometimes') {
      return 2;
    } else if (response == 'Not Really') {
      return 1;
    } else {
      return 0;
    }
  }

  Future<void> _saveAsPdf(BuildContext context) async {
    final pdf = pdfLib.Document();

    _addPdfContent(pdf);

    final Uint8List bytes = await pdf.save();
    final directory = (await getExternalStorageDirectory())!.path;
    final file = File('$directory/assessment_report.pdf');
    await file.writeAsBytes(bytes);

    await OpenFile.open(file.path);
  }

  void _addPdfContent(pdfLib.Document pdf) {
    pdf.addPage(
      pdfLib.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pdfLib.Context context) {
          return pdfLib.Column(
            crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
            children: [
              pdfLib.Text('Date: ${DateTime.now()}'),
              pdfLib.Text('Counselor Name: [Counselor Name]'),
              pdfLib.Text('Counselor Mail ID: [Counselor Mail ID]'),
              pdfLib.SizedBox(height: 10),
              pdfLib.Text('Name of Child: [Child Name]'),
              pdfLib.Text('Child ID: [Child ID]'),
              pdfLib.Text('Family Code: [Family Code]'),
              pdfLib.Text('Date of Birth: [Date of Birth]'),
              pdfLib.SizedBox(height: 10),
              pdfLib.Text('Parent\'s Name: [Parent\'s Name]'),
              pdfLib.Text('Parent\'s Phone No: [Parent\'s Phone No]'),
              pdfLib.Text('Parent\'s Mail ID: [Parent\'s Mail ID]'),
              pdfLib.SizedBox(height: 10),
              pdfLib.Container(
                width: 500,
                height: 300,
                child: widget(
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(show: false),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(
                          color: const Color(0xff37434d),
                          width: 1,
                        ),
                      ),
                      minX: 0,
                      maxX: responses.length.toDouble() - 1,
                      minY: 0,
                      maxY: 4,
                      lineBarsData: [
                        LineChartBarData(
                          spots: _generateChartData(responses),
                          isCurved: true,
                          colors: [Colors.blue],
                          dotData: FlDotData(show: false),
                          belowBarData: BarAreaData(show: false),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              pdfLib.SizedBox(height: 10),
              pdfLib.Text('Quiz Score: $totalScore'),
              // Add more information as needed
            ],
          );
        },
      ),
    );
  }
}

widget({required LineChart child}) {
}
