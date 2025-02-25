import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String text;
  final Alignment alignment;

  const MyTextField({
    super.key,
    required this.text,
    this.alignment = Alignment.centerLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade200,
        border: Border.all(color: Colors.deepPurple, width: 1.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: EdgeInsets.all(20.0),
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(fontSize: 20.0, color: Colors.deepPurple.shade900),
      ),
    );
  }
}

class TextAlignment {}
