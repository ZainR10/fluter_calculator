import 'package:flutter/material.dart';

//buttons for calculator
class Mybutton extends StatelessWidget {
  final String title;
  const Mybutton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 80,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
        child: Center(
            child: Text(
          title,
          style: TextStyle(fontSize: 25, color: Colors.white),
        )),
      ),
    );
  }
}
