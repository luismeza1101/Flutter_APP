import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/main_screen.dart';
import 'package:flutter_application_1/screens/user_confi_screen.dart';

class MainLayout extends StatefulWidget {
  final String name;
  final String email;
  const MainLayout({super.key, required this.name, required this.email});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const MainScreen(),
      UserConfiScreen(name: widget.name, email: widget.email),
    ];
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            centerTitle: true,
            title: Image.asset(
              'assets/imgs/logo.png',
              height: 65.0,
            ),
          ),
        ),
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.red,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.red,
              ),
              label: '',
            ),
          ],
          elevation: 0, // Sin sombra
        ),
      ),
    );
  }
}
