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
    // double buttonHeight = MediaQuery.of(context).size.height * 0.12;
    // double buttonWidth = MediaQuery.of(context).size.width * 0.22;
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 80,
            // width: buttonWidth,
            decoration:
                BoxDecoration(shape: BoxShape.rectangle, color: myColor),
            child: Center(
              child: Text(
                title,
                style: GoogleFonts.getFont('Orbitron',
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
