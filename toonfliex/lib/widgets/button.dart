import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color backcolor;
  final Color textcolor;
  const Button(
      {super.key,
      required this.text,
      required this.backcolor,
      required this.textcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backcolor, borderRadius: BorderRadius.circular(50)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w700, color: textcolor),
        ),
      ),
    );
  }
}
