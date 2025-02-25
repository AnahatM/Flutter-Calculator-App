import 'package:flutter/material.dart';
import 'package:flutter_calculator/components/my_button.dart';
import 'package:flutter_calculator/components/my_text_field.dart';

void main() => runApp(MyApp());

// Main App Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

// Home Page Widget
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// Home Page State
class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAnswer = '';

  // List of Calculator Buttons
  final List<String> buttons = [
    "C",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "x",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "ANS",
    "=",
  ];

  // Method to classify operators
  Map<String, Color> getButtonColors(String buttonText) {
    switch (buttonText) {
      case "C":
      case "DEL":
        return {
          'color': Colors.blue.shade500,
          'textColor': Colors.blue.shade50,
        };
      case "%":
      case "/":
      case "x":
      case "-":
      case "+":
        return {
          'color': Colors.deepPurple.shade400,
          'textColor': Colors.deepPurple.shade50,
        };
      case "=":
        return {
          'color': Colors.deepPurple.shade500,
          'textColor': Colors.deepPurple.shade50,
        };
      default:
        return {
          'color': Colors.deepPurple.shade50,
          'textColor': Colors.deepPurple,
        };
    }
  }

  // Method to build GridView
  Widget buildGridView() {
    return GridView.builder(
      itemCount: buttons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemBuilder: (BuildContext context, int index) {
        return MyButton(
          buttonTapped: getOnTapFunction(index),
          buttonText: buttons[index],
          color: getButtonColors(buttons[index])['color'] ?? Colors.black,
          textColor:
              getButtonColors(buttons[index])['textColor'] ?? Colors.white,
        );
      },
    );
  }

  // Method to get onTap Function for each button
  void Function()? getOnTapFunction(int index) {
    return switch (buttons[index]) {
      "C" => () {
        setState(() {
          userQuestion = '';
          userAnswer = '';
        });
      },
      "DEL" => () {
        setState(() {
          if (userQuestion.isNotEmpty) {
            userQuestion = userQuestion.substring(0, userQuestion.length - 1);
          }
        });
      },
      "=" => () {
        setState(() {
          // Here you can add the logic to evaluate the expression
          // For example, using a package like 'expressions' or 'math_expressions'
          // userAnswer = evaluateExpression(userQuestion);
        });
      },
      _ => () {
        setState(() {
          userQuestion += buttons[index];
        });
      },
    };
  }

  // Build Method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          // Top UI Container
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Display User Question Box
                  MyTextField(text: userQuestion),
                  const SizedBox(height: 10.0),
                  // Display User Answer Box
                  MyTextField(
                    text: userAnswer,
                    alignment: Alignment.centerRight,
                  ),
                ],
              ),
            ),
          ),

          // Bottom UI Container with Calculator Buttons
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: buildGridView(),
            ),
          ),
        ],
      ),
    );
  }
}
