import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_model/calculator_view_model.dart';
import '../../utils/operation.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    super.key,
    required this.operation,
    required this.firstController,
    required this.secondController,
  });

  final Operation operation;
  final TextEditingController firstController;
  final TextEditingController secondController;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CalculatorViewModel>(context);
    return ElevatedButton(
      onPressed: () {
        viewModel.calculate(
          operation: operation,
          firstText: firstController.text,
          secondText: secondController.text,
        );
      },
      child: Text(operation.name),
    );
  }
}
