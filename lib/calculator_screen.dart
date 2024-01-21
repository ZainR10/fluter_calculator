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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 33, 35, 36),
        // appBar: AppBar(title: const Text('calculator')),
        body: Column(children: [
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Mybutton(
                        title: 'Ac',
                        myColor: const Color.fromARGB(255, 71, 255, 169),
                        onPress: () {
                          userInput = '';
                          answer = '';
                          setState(() {});
                        },
                      ),
                      Mybutton(
                          title: '+/-',
                          myColor: const Color.fromARGB(255, 71, 255, 169),
                          onPress: () {
                            userInput += '+/-';
                            setState(() {});
                          }),
                      Mybutton(
                          title: '%',
                          myColor: const Color.fromARGB(255, 71, 255, 169),
                          onPress: () {
                            userInput += '%';
                            setState(() {});
                          }),
                      Mybutton(
                        title: '/',
                        myColor: const Color.fromARGB(255, 71, 255, 169),
                        onPress: () {
                          userInput += '/';
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Mybutton(
                        title: '7',
                        onPress: () {
                          userInput += '7';
                          setState(() {});
                        },
                      ),
                      Mybutton(
                          title: '8',
                          onPress: () {
                            userInput += '8';
                            setState(() {});
                          }),
                      Mybutton(
                          title: '9',
                          onPress: () {
                            userInput += '9';
                            setState(() {});
                          }),
                      Mybutton(
                        title: 'x',
                        myColor: const Color.fromARGB(255, 71, 255, 169),
                        onPress: () {
                          userInput += 'x';
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Mybutton(
                        title: '4',
                        onPress: () {
                          userInput += '4';
                          setState(() {});
                        },
                      ),
                      Mybutton(
                          title: '5',
                          onPress: () {
                            userInput += '5';
                            setState(() {});
                          }),
                      Mybutton(
                          title: '6',
                          onPress: () {
                            userInput += '6';
                            setState(() {});
                          }),
                      Mybutton(
                        title: '-',
                        myColor: const Color.fromARGB(255, 71, 255, 169),
                        onPress: () {
                          userInput += '-';
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Mybutton(
                        title: '1',
                        onPress: () {
                          userInput += '1';
                          setState(() {});
                        },
                      ),
                      Mybutton(
                          title: '2',
                          onPress: () {
                            userInput += '2';
                            setState(() {});
                          }),
                      Mybutton(
                          title: '3',
                          onPress: () {
                            userInput += '3';
                            setState(() {});
                          }),
                      Mybutton(
                        title: '+',
                        myColor: const Color.fromARGB(255, 71, 255, 169),
                        onPress: () {
                          userInput += '+';
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Mybutton(
                        title: '0',
                        onPress: () {
                          userInput += '0';
                          setState(() {});
                        },
                      ),
                      Mybutton(
                          title: '.',
                          onPress: () {
                            userInput += '.';
                            setState(() {});
                          }),
                      Mybutton(
                          title: 'Del',
                          onPress: () {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          }),
                      Mybutton(
                        title: '=',
                        myColor: const Color.fromARGB(255, 71, 255, 169),
                        onPress: () {
                          equalPress();
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

//fucntion for equal button
//this whole fuction is created with the help of math expression package.this function will convert concatinated strings
//into mathematical functionalities like 1+1 will be equal to 2 not 11<---(concotination).when the equal button is pressed
  void equalPress() {
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*'); //to replace x to multiply
    Parser p = Parser(); //to parse string to int
    Expression expression = p.parse(finalUserInput); //for the right answer
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
