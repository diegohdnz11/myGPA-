import 'package:flutter/material.dart';
import 'package:classic_gpa/presentation/pages/Home/home.dart';
void main() {
  runApp(const MyGpa());
}

class MyGpa extends StatelessWidget {
  const MyGpa({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
