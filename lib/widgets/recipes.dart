import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/information_recipe_screen.dart';

class Recipes extends StatelessWidget {
  final List<Map<String, dynamic>> recipes;
  const Recipes({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    if (recipes.isEmpty) {
      return const Center(
        child: Text('No se encontraron recetas.'),
      );
    }

    return Container(
      margin: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 4),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Card(
              margin: EdgeInsets.zero,
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                title: Text(
                  recipe['title'] ?? 'Sin título',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InformationRecipeScreen(
                              recipeId: recipe['id'],
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'Detalles',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
                leading: recipe['image'] != null
                    ? Image.network(
                        'https://cors-anywhere.herokuapp.com/${recipe['image']}',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      )
                    : const Icon(
                        Icons.fastfood,
                        size: 50,
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
