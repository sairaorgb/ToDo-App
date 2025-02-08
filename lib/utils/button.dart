import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonName;
  final VoidCallback buttonFunction;
  Button({super.key, required this.buttonFunction, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(backgroundColor: Colors.black),
        onPressed: buttonFunction,
        child: Text(
          buttonName,
          style: TextStyle(fontSize: 18, color: Colors.yellow),
        ));
  }
}
