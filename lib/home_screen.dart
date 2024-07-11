import 'dart:math';

import 'package:bmi/age_widget.dart';
import 'package:flutter/material.dart';
import 'package:bmi/height_widget.dart';
import 'package:bmi/gender_widget.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

void main() => runApp(const HomeScreen());

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyAppState();
}

class _MyAppState extends State<HomeScreen> {
  int _gender = 0;
  int _height = 150;
  int _age = 30;
  int _weight = 50;
  bool _isFinished = false;
  double _bmiScore = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI App',
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
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AgeWidget(
                            onChange: (ageVal) {
                              _age = ageVal;
                            },
                            title: ('Age'),
                            initValue: 20,
                            min: 0,
                            max: 100),
                        AgeWidget(
                            onChange: (weightVal) {
                              _weight = weightVal;
                            },
                            title: ('Weight(Kg)'),
                            initValue: 55,
                            min: 0,
                            max: 200),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    child: SwipeableButtonView(
                      isFinished: _isFinished,
                      onFinish: () {
                        setState(() {
                          _isFinished = false;
                        });
                      },
                      onWaitingProcess: () {
                        // Call the function here
                        calculateBmi();
                        Future.delayed(Duration(seconds: 1), () {
                          setState(() {
                            _isFinished = true;
                          });
                        });
                      },
                      activeColor: Color.fromARGB(255, 244, 204, 27),
                      buttonWidget: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                        size: 35,
                      ),
                      buttonText: "CALCULATE",
                      buttontextstyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void calculateBmi() {
    _bmiScore = _weight / pow(_height / 100, 2);
  }
}
