import 'package:flutter/material.dart';

class GenderWidget extends StatefulWidget {
  final Function(int) onChange;

  const GenderWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  _GenderWidgetState createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  int _gender = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChoiceChip(
            label: Column(
              children: [
                Image.asset(
                  "assets/images/man.png",
                  width: 70,
                ),
                const SizedBox(height: 5),
                const Text(
                  "Male",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            selected: _gender == 1,
            onSelected: (bool selected) {
              setState(() {
                _gender = selected ? 1 : 0;
              });
              widget.onChange(_gender);
            },
            selectedColor: Colors.grey[200],
            backgroundColor: Colors.grey[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.grey),
            ),
          ),
          const SizedBox(width: 20),
          ChoiceChip(
            label: Column(
              children: [
                Image.asset(
                  "assets/images/woman.png",
                  width: 70,
                ),
                const SizedBox(height: 5),
                const Text(
                  "Female",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            selected: _gender == 2,
            onSelected: (bool selected) {
              setState(() {
                _gender = selected ? 2 : 0;
              });
              widget.onChange(_gender);
            },
            selectedColor: Colors.grey[200],
            backgroundColor: Colors.grey[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
