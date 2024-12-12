import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/recipes_random.dart';
import 'package:flutter_application_1/widgets/recipes.dart';
import 'package:flutter_application_1/widgets/options_search.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Map<String, dynamic>> _recipes = [];

  @override
  void initState() {
    super.initState();
    _loadRandomRecipes();
  }

  Future<void> _loadRandomRecipes() async {
    final randomRecipes = await fetchRecipesRandoms();

    setState(() {
      _recipes = randomRecipes;
    });

  }

  void _updateRecipes(List<Map<String, dynamic>> newRecipes) {
    setState(() {
      _recipes = newRecipes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '¿QUÉ COMIDA ESTÁS BUSCANDO?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          OptionsSearch(onSearch: _updateRecipes),
          const SizedBox(height: 10),
          Expanded(
            child: Recipes(
              recipes: _recipes,
            ),
          ),
        ],
      ),
    );
  }
}
