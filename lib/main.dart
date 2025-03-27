import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      ),
      home: const MyHomePage(title: 'Mini Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  String _result = "";

  void _add() {
    final firstValue = double.tryParse(_firstController.text);
    final secondValue = double.tryParse(_secondController.text);

    if (firstValue != null && secondValue != null) {
      setState(() {
        _result = (firstValue + secondValue).toString();
      });
    } else {
      setState(() {
        _result = "Invalid input";
      });
    }
  }

  void _subtract() {
    final firstValue = double.tryParse(_firstController.text);
    final secondValue = double.tryParse(_secondController.text);

    if (firstValue != null && secondValue != null) {
      setState(() {
        _result = (firstValue - secondValue).toString();
      });
    } else {
      setState(() {
        _result = "Invalid input";
      });
    }
  }

  void _multiply() {
    final firstValue = double.tryParse(_firstController.text);
    final secondValue = double.tryParse(_secondController.text);

    if (firstValue != null && secondValue != null) {
      setState(() {
        _result = (firstValue * secondValue).toString();
      });
    } else {
      setState(() {
        _result = "Invalid input";
      });
    }
  }

  void _divide() {
    final firstValue = double.tryParse(_firstController.text);
    final secondValue = double.tryParse(_secondController.text);

    if (firstValue != null && secondValue != null && secondValue != 0) {
      setState(() {
        _result = (firstValue / secondValue).toString();
      });
    } else {
      setState(() {
        _result = "Invalid input";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _firstController,
              decoration: InputDecoration(
                labelText: "First Input",
                border: OutlineInputBorder(),
                constraints: BoxConstraints(maxWidth: 500),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _secondController,
              decoration: InputDecoration(
                labelText: "Second Input",
                border: OutlineInputBorder(),
                constraints: BoxConstraints(maxWidth: 500),
              ),
            ),
            const SizedBox(height: 16.0),
            Wrap(
              spacing: 10, // Space between buttons
              runSpacing: 10, // Space between rows
              alignment: WrapAlignment.center, // Align buttons to center
              children: [
                _buildCalcButton("+", "Add"),
                _buildCalcButton("-", "Subtract"),
                _buildCalcButton("*", "Multiply"),
                _buildCalcButton("÷", "Divide"),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              "Result: $_result",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalcButton(dynamic buttonContent, String tooltip) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: () {
          // Add functionality here
          if (tooltip == "Add") {
            _add();
          } else if (tooltip == "Subtract") {
            _subtract();
          } else if (tooltip == "Multiply") {
            _multiply();
          } else if (tooltip == "Divide") {
            _divide();
          }
          print("$tooltip Button Pressed");
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(buttonContent, style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
