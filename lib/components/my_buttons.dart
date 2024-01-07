import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//buttons for calculator
class Mybutton extends StatelessWidget {
  final String title;
  final Color myColor;
  final VoidCallback onPress;
  const Mybutton(
      {super.key,
      required this.title,
      this.myColor = const Color(0xffa5a5a5),
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 80,
            decoration: BoxDecoration(shape: BoxShape.circle, color: myColor),
            child: Center(
              child: Text(
                title,
                style: GoogleFonts.getFont('Pacifico', fontSize: 30),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
