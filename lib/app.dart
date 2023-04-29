import 'package:flutter/material.dart';
import 'package:lab4/view/number_generator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pick a Greater Number Game',
      initialRoute: '/',
      routes: {'/': (context) => const NumberGeneratorScreen()},
    );
  }
}
