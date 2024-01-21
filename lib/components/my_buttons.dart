import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//buttons for calculator
class Mybutton extends StatelessWidget {
  final String title; //button value or num
  final Color myColor; //button color
  final VoidCallback onPress;
  const Mybutton(
      // construtor for this function
      {super.key,
      required this.title,
      this.myColor = const Color(0xffa5a5a5),
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    //used media query to adjust width and hieght for different screen sizes
    double buttonHeight = MediaQuery.of(context).size.height * 0.12;
    double buttonWidth = MediaQuery.of(context).size.width * 0.22;
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: buttonHeight, //from media query
            width: buttonWidth, //from media query
            decoration:
                BoxDecoration(shape: BoxShape.rectangle, color: myColor),
            child: Center(
              child: Text(
                title,
                style: GoogleFonts.getFont('Orbitron', fontSize: 30),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
