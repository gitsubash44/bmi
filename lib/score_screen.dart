import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';

class ScoreScreen extends StatelessWidget {
  final double bmiScore;
  final int age;

  const ScoreScreen({super.key, required this.bmiScore, required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI Score'),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Card(
          elevation: 12,
          shape: const RoundedRectangleBorder(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Your Score',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 251, 144, 5),
                ),
              ),
              PrettyGauge(
                gaugeSize: 300,
                minValue: 0,
                maxValue: 40,
                segments: [
                  GaugeSegment('UnderWeight', 19, Colors.red),
                  GaugeSegment('Normal', 5.9, Colors.green),
                  GaugeSegment('OverWeight', 5, Colors.orange),
                  GaugeSegment('Obese', 10.1, Colors.pink),
                ],
                valueWidget: Text(
                  bmiScore.toStringAsFixed(1),
                  style: const TextStyle(fontSize: 40),
                ),
                currentValue: bmiScore.toDouble(),
                needleColor: const Color.fromARGB(255, 247, 227, 15),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
