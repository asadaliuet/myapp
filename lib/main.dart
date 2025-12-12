import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const PCMSelectionApp());
}

class PCMSelectionApp extends StatelessWidget {
  const PCMSelectionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PCM Selection Advisor',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const PCMSelectionHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}