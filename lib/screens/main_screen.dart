import 'package:flutter/material.dart';
// import 'package:flutter_application_1/services/recetes_by_ingredients.dart';
import 'package:flutter_application_1/services/recetes_excluyen_ingredient.dart';
// import 'package:flutter_application_1/services/recetes.dart';
// import 'package:flutter_application_1/services/recetes_by_name.dart';
import 'package:flutter_application_1/widgets/options_search.dart';
// import 'package:flutter_application_1/widgets/filter_acordion.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {},
            ),
            title: Image.asset(
              'assets/imgs/logo.png',
              height: 65.0,
            ),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '¿QUÉ COMIDA ESTÁS BUSCANDO?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              OptionsSearch(),
              SizedBox(height: 10),
              Expanded(
                // child: Recetes(),
                // child: RecetesByName(),
                child: RecetesExcluyenIngredient(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
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
                Icons.favorite_border,
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
