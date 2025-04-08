import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(
            color: Color(0xFF0a0d22),
          ),
          scaffoldBackgroundColor: Color(0xFF0a0d22),
         ),
      home: InputPage(),
    );
  }
}

