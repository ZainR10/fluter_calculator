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
  //fucntion to store user input
  var userInput = '';
  //fucntion for  anwser
  var answer = '';

  //list of buttons
  List<String> buttons = [
    'Ac',
    '+/-',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'Del',
    '='
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 33, 35, 36),
        body: Column(
          children: [
            Flexible(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        userInput.toString(),
                        style: GoogleFonts.getFont('Orbitron',
                            fontSize: 30,
                            color: const Color.fromARGB(255, 71, 255, 169)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      answer.toString(),
                      style: GoogleFonts.getFont('Orbitron',
                          fontSize: 30,
                          color: const Color.fromARGB(255, 71, 255, 169)),
                    ),
                  ],
                ),
              ),
            ),

            // buttons

            Flexible(
              fit: FlexFit.tight,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: buttons.length,
                  itemBuilder: (context, index) {
                    return Mybutton(
                      title: buttons[index],
                      onPress: () {
                        handleButtonPress(buttons[index]);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// logic for del,= and AC because i am using  gridview and have to give different logic thats why created this fucntion.
  void handleButtonPress(String buttonValue) {
    if (buttonValue == 'Del') {
      userInput = userInput.substring(0, userInput.length - 1);
    } else if (buttonValue == '=') {
      equalPress();
    } else if (buttonValue == 'Ac') {
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
}
