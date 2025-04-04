import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/calculator_view.dart';
import 'view_model/calculator_view_model.dart';


void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => CalculatorViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      ),
       home: const CalculatorView(),
    );
  }
}
