import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  ///singleton
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: null,
    );
  }
}
