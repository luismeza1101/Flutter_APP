import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Good Food',
      home: const MainScreen(),
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(234, 231, 231, 1.0),
          primaryColor: const Color.fromRGBO(244, 66, 53, 1.0)),
    );
  }
}
