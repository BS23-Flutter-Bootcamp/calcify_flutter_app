import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/calculator_view_model.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CalculatorViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Mini Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: viewModel.firstController,
              decoration: InputDecoration(labelText: "First Input"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: viewModel.secondController,
              decoration: InputDecoration(labelText: "Second Input"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 10, // Space between buttons
              runSpacing: 10, // Space between rows
              alignment: WrapAlignment.center, // Align buttons to center
              children: [
                _buildCalcButton("Add", viewModel),
                _buildCalcButton("Subtract", viewModel),
                _buildCalcButton("Multiply", viewModel),
                _buildCalcButton("Divide", viewModel),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "Result: ${viewModel.result}",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalcButton(String operation, CalculatorViewModel viewModel) {
    return ElevatedButton(
      onPressed: () => viewModel.calculate(operation),
      child: Text(operation),
    );
  }
}
