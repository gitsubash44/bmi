import 'package:flutter/material.dart';

class AgeWidget extends StatefulWidget {
  final Function(int) onChange;
  final String title;
  final int initValue;
  final int min;
  final int max;

  const AgeWidget({
    super.key,
    required this.onChange,
    required this.title,
    required this.initValue,
    required this.min,
    required this.max,
  });

  @override
  State<AgeWidget> createState() => _AgeWidgetState();
}

class _AgeWidgetState extends State<AgeWidget> {
  int counter = 0;
  @override
  void initState() {
    // TODO: implement initState

    counter = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                InkWell(
                  child: const CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.yellowAccent,
                    child: Icon(
                      Icons.remove,
                      color: Colors.black87,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      if (counter > widget.min) {
                        counter--;
                      }
                    });
                    widget.onChange(counter);
                  },
                ),
                const SizedBox(
                  height: 10,
                  width: 15,
                ),
                Text(
                  counter.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                  width: 15,
                ),
                InkWell(
                  child: const CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.yellowAccent,
                    child: Icon(
                      Icons.add,
                      color: Colors.black87,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      if (counter < widget.max) {
                        counter++;
                      }
                    });
                    widget.onChange(counter);
                  },
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
