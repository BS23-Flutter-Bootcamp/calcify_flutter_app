import 'package:flutter/material.dart';
import 'package:flutter_mini_calculator/view/widgets/calculator_button.dart';
import 'package:provider/provider.dart';
import '../view_model/calculator_view_model.dart';

class CalculatorView extends StatelessWidget {
  CalculatorView({super.key});
  final firstController = TextEditingController();
  final secondController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CalculatorViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Mini Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: firstController,
              decoration: InputDecoration(labelText: "First Input"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: secondController,
              decoration: InputDecoration(labelText: "Second Input"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                CalculatorButton(
                  operation: "+",
                  viewModel: viewModel,
                  firstController: firstController,
                  secondController: secondController,
                ),
                CalculatorButton(
                  operation: "-",
                  viewModel: viewModel,
                  firstController: firstController,
                  secondController: secondController,
                ),
                CalculatorButton(
                  operation: "*",
                  viewModel: viewModel,
                  firstController: firstController,
                  secondController: secondController,
                ),
                CalculatorButton(
                  operation: "/",
                  viewModel: viewModel,
                  firstController: firstController,
                  secondController: secondController,
                ),
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
}
