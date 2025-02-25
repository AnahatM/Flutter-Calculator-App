import 'package:flutter/material.dart';
import 'package:flutter_calculator/components/my_button.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          // Top UI Container
          Expanded(child: Container()),
          // Bottom UI Container with Calculator Buttons
          Expanded(
            flex: 2,
            // GridView to display Calculator Buttons
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                itemCount: buttons.length,
                // Display 4 buttons in a row
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return MyButton(
                    buttonText: buttons[index],
                    color:
                        getButtonColors(buttons[index])['color'] ??
                        Colors.black,
                    textColor:
                        getButtonColors(buttons[index])['textColor'] ??
                        Colors.white,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
