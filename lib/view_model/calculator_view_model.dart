import 'package:flutter/material.dart';
import '../model/calculator_model.dart';
import '../utils/operation.dart';

class CalculatorViewModel extends ChangeNotifier {
  final CalculatorModel _model = CalculatorModel();
  String _result = '';
  String get result => _result;
  late final _operationMap = {
    Operation.add: _model.add,
    Operation.subtract: _model.subtract,
    Operation.multiply: _model.multiply,
    Operation.divide: _model.divide,
  };

  void calculate({
    required Operation operation,
    required String firstText,
    required String secondText,
  }) {
    final first = double.tryParse(firstText);
    final second = double.tryParse(secondText);

    if (first == null || second == null) {
      _result = "Invalid input";
    } else {
      try {
        final func = _operationMap[operation];
        if (func != null) {
          _result = func(first, second).toString();
        } else {
          _result = "Function is not defined";
        }
      } catch (e) {
        _result = e.toString();
      }
    }

    notifyListeners();
  }
}
