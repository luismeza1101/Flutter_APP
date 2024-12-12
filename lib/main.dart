import 'package:flutter/material.dart';
// import 'package:flutter_application_1/layouts/main_layout.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://cjabvuhacdijwlbmjpgt.supabase.co', 
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNqYWJ2dWhhY2RpandsYm1qcGd0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM5MzI0MDUsImV4cCI6MjA0OTUwODQwNX0.UotZyCTbo3q_gkbQ3-eUI9n1qkMCt4-s9twTWTcdnRY',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Good Food',
      home: const LoginScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(234, 231, 231, 1.0),
        primaryColor: const Color.fromRGBO(244, 66, 53, 1.0),
      ),
    );
  }
}
