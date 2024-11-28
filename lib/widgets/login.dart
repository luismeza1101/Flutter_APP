import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/form_login.dart';
import 'package:flutter_application_1/widgets/form_register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int _selectedIndex = 0;

  final TextStyle buttonCustom = const TextStyle(
    color: Colors.white,
    fontSize: 17.0,
  );

  // ignore: unused_element
  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Register Status'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: SegmentedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                      if (states.contains(WidgetState.selected)) {
                        return Theme.of(context).primaryColor;
                      }
                      return const Color.fromARGB(255, 82, 82, 82);
                    }),
                    iconSize: const WidgetStatePropertyAll(0.0),
                  ),
                  segments: [
                    ButtonSegment<int>(
                      value: 0,
                      label: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          'Log In',
                          style: buttonCustom,
                        ),
                      ),
                    ),
                    ButtonSegment<int>(
                      value: 1,
                      label: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          'Sign Up',
                          style: buttonCustom,
                        ),
                      ),
                    ),
                  ],
                  selected: {_selectedIndex},
                  onSelectionChanged: (Set<int> newSelection) {
                    setState(() {
                      _selectedIndex = newSelection.first;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'welcome to good food',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              if (_selectedIndex == 0) ...[
                FormLogin(onLoginError: _showDialog)
              ] else if (_selectedIndex == 1) ...[
                FormRegister(onRegisterError: _showDialog)
              ]
            ],
          ),
        ),
      ),
    );
  }
}
