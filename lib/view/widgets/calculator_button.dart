import 'package:flutter/material.dart';
import '../../view_model/calculator_view_model.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    super.key,
    required this.operation,
    required this.viewModel,
    required this.firstController,
    required this.secondController,
  });

  final String operation;
  final CalculatorViewModel viewModel;
  final TextEditingController firstController;
  final TextEditingController secondController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        viewModel.calculate(
          operation: operation,
          firstText: firstController.text,
          secondText: secondController.text,
        );
      },
      child: Text(operation),
    );
  }
}
