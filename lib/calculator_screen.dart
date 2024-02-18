import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/my_buttons.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
// logic for del,= and AC because i am using  gridview and have to give different logic thats why created this fucntion.
  void handleButtonPress(String buttonValue) {
    if (buttonValue == 'Del') {
      userInput = userInput.substring(0, userInput.length - 1);
    } else if (buttonValue == '=') {
      equalPress();
    } else if (buttonValue == 'AC') {
      userInput = '';
      answer = '';
    } else {
      userInput += buttonValue;
    }
    setState(() {});
  }

  void equalPress() {
    //logic for = press.this method is done with help of math expression package.
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x',
        '*'); //x repalce multiply button but will perform multiply functionality
    Parser p = Parser(); //paser for string values into int
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
    setState(() {});
  }

  //fucntion to store user input
  var userInput = '';
  //fucntion for  anwser
  var answer = '';

  //list of buttons
  List<String> buttons = [
    '7',
    '8',
    '9',
    '%',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    'AC',
    '0',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    // backgroundColor: const Color.fromARGB(255, 33, 35, 36)

    Widget display = Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo[200],
          borderRadius: orientation == Orientation.portrait
              ? const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))
              : const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(24),
        alignment: Alignment.topRight,
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Align children to the bottom
          crossAxisAlignment:
              CrossAxisAlignment.end, // Align children to the right
          children: [
            Text(
              userInput.toString(),
              style: GoogleFonts.getFont('Orbitron',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo[50]),
            ),
            Text(
              answer.toString(),
              style: GoogleFonts.getFont('Orbitron',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo[50]),
            ),
          ],
        ),
      ),
    );

    Widget buttonGrid = Expanded(
      flex: orientation == Orientation.portrait
          ? 2
          : 1, // Takes 2 parts of the screen in landscape or the full height in portrait

      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 4,
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        children: buttons.map((buttonText) {
          return Mybutton(
            title: buttonText,
            onPress: () {
              handleButtonPress(buttonText);
            },
          );
        }).toList(),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: orientation == Orientation.portrait
          ? Column(
              children: [
                display,
                buttonGrid,
              ],
            )
          : Row(
              children: [
                display,
                buttonGrid,
              ],
            ),
    );
  }
}
