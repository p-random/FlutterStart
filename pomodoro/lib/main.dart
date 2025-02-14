import 'package:flutter/material.dart';
import 'widget/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFE7626C),
        textTheme: TextTheme(
            headlineMedium: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 20,
          color: Color(0xFF232B55),
        )),
        cardColor: Color(0xFFF4EDDB),
      ),
      home: Home(),
    );
  }
}
