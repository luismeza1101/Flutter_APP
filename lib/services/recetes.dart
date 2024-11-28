import 'dart:convert'; // Importar para usar json.decode()
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Recetes extends StatelessWidget {
  const Recetes({super.key});

  Future<List<Map<String, dynamic>>> fetchRecipes() async {
    const apiKey = "1452c0b80cae40c981ad2f4f8941c4c2";
    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/recipes/random?apiKey=$apiKey&number=10'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      List<Map<String, dynamic>> recipes = (data['recipes'] as List).map((recipe) {
        return {
          'id': recipe['id'], // ID de la receta
          'title': recipe['title'], // Título de la receta
          'image': recipe['image'], // Imagen de la receta
          'readyInMinutes': recipe['readyInMinutes'], // Tiempo de la preparacion
        };
      }).toList();

      return recipes; 
    } else {
      throw Exception('Error al obtener las recetas');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchRecipes(), 
      builder: (context, snapshot) {
        // Si está esperando la respuesta, muestra un indicador de carga
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        // Si hubo un error, lo muestra
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        // Si no hay datos o la lista está vacía, muestra un mensaje
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No se encontraron recetas.'));
        }

        final recipes = snapshot.data!; // Accede a la lista de recetas

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
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ID: ${recipe['id'] ?? 'Sin ID'}', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                        Text('Ready In: ${recipe['readyInMinutes']} minutes', style: TextStyle(fontSize: 14, color: Colors.grey[600])), 
                      ],
                    ),
                    leading: recipe['image'] != null
                        ? Image.network(
                            recipe['image'], 
                            width: 50,
                            height: 50,
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
      },
    );
  }
}
