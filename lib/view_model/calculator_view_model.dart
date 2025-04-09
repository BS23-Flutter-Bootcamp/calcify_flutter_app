import 'package:flutter/material.dart';
import '../model/calculator_model.dart';

class CalculatorViewModel extends ChangeNotifier {
  final CalculatorModel _model = CalculatorModel();
  String _result = '';
  String get result => _result;

  void calculate({
    required String operation,
    required String firstText,
    required String secondText,
  }) {
    final first = double.tryParse(firstText);
    final second = double.tryParse(secondText);

    if (first == null || second == null) {
      _result = "Invalid input";
    } else {
      try {
        final operations = {
          '+': _model.add,
          '-': _model.subtract,
          '*': _model.multiply,
          '/': _model.divide,
        };
        if (operations.containsKey(operation)) {
          _result = operations[operation]!(first, second).toString();
        } else {
          _result = "Unknown operation";
        }
      } catch (e) {
        _result = e.toString();
      }
    }

    notifyListeners();
  }
}
