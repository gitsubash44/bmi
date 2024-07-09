import 'package:flutter/material.dart';

class HeightWidget extends StatefulWidget {
  final Function(int) onChange;

  const HeightWidget({super.key, required this.onChange});

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  int _height = 150;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(),
        child: Column(
          children: [
            Text(
              "Height",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _height.toString(),
                  style: const TextStyle(fontSize: 36),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "cm",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            Slider(
              activeColor: const Color.fromARGB(255, 183, 144, 6),
              inactiveColor: const Color.fromARGB(255, 237, 211, 117),
              thumbColor: const Color.fromARGB(255, 245, 100, 3),
              min: 0,
              max: 250,
              value: _height.toDouble(),
              onChanged: (value) {
                setState(() {
                  _height = value.toInt();
                });
                widget.onChange(_height);
              },
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
