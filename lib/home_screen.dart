import 'package:flutter/material.dart';
import 'package:bmi/height_widget.dart';
import 'package:bmi/gender_widget.dart';

void main() => runApp(const HomeScreen());

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyAppState();
}

class _MyAppState extends State<HomeScreen> {
  int _gender = 0; // Declare the _gender variable here
  int _height = 150;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: const Text(
            'BMI Measurement',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(12.0),
            child: Card(
              elevation: 12,
              shape: const RoundedRectangleBorder(),
              child: Column(
                children: [
                  // Gender selection for men and women
                  GenderWidget(
                    onChange: (genderVal) {
                      setState(() {
                        _gender = genderVal;
                      });
                    },
                  ),
                  HeightWidget(
                    onChange: (heightVal) {
                      _height = heightVal;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
