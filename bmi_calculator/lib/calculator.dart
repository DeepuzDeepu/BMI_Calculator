import 'dart:math';

class Calculator {
  final int height; // in centimeters
  final int weight; // in kilograms
  late double _BMI;

  Calculator({required this.weight, required this.height}) {
    if (height <= 0 || weight <= 0) {
      throw ArgumentError('Height and weight must be positive values.');
    }
  }

  String calculateBMI() {
    _BMI = weight / pow(height / 100, 2);
    return _BMI.toStringAsFixed(1);
  }

  String getResult() {
    if (_BMI >= 25) {
      return 'OVERWEIGHT';
    } else if (_BMI > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation() {
    if (_BMI >= 25) {
      return 'You are above the normal weight range. Consider exercising more.';
    } else if (_BMI > 18.5) {
      return 'You have a normal body weight.';
    } else {
      return 'You are below the normal weight range. Consider eating more.';
    }
  }
}
