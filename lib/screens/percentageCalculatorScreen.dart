import 'package:flutter/material.dart';

class PercentageCalculatorScreen extends StatefulWidget {
  const PercentageCalculatorScreen({super.key});

  @override
  State<PercentageCalculatorScreen> createState() =>
      _PercentageCalculatorScreenState();
}

class _PercentageCalculatorScreenState
    extends State<PercentageCalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Percentage Calc Screen'));
  }
}
