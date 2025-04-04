import 'package:flutter/material.dart';
import '../model/calculator_model.dart';

class CalculatorViewModel extends ChangeNotifier {
  final CalculatorModel _model = CalculatorModel();

  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();

  String _result = '';
  String get result => _result;

  void calculate(String operation) {
    final first = double.tryParse(firstController.text);
    final second = double.tryParse(secondController.text);

    if (first == null || second == null) {
      _result = "Invalid input";
    } else {
      try {
        switch (operation) {
          case 'Add':
            _result = _model.add(first, second).toString();
            break;
          case 'Subtract':
            _result = _model.subtract(first, second).toString();
            break;
          case 'Multiply':
            _result = _model.multiply(first, second).toString();
            break;
          case 'Divide':
            _result = _model.divide(first, second).toString();
            break;
          default:
            _result = "Unknown operation";
        }
      } catch (e) {
        _result = e.toString();
      }
    }

    notifyListeners();
  }
}
