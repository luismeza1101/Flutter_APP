import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/information_recipe.dart';

class InformationRecipeScreen extends StatefulWidget {
  final int recipeId;
  const InformationRecipeScreen({super.key, required this.recipeId});

  @override
  State<InformationRecipeScreen> createState() =>
      _InformationRecipeScreenState();
}

class _InformationRecipeScreenState extends State<InformationRecipeScreen> {
  late Future<Map<String, dynamic>> recipeDetails;

  @override
  void initState() {
    super.initState();
    recipeDetails = fetchInformationRecipe(widget.recipeId);
  }

  @override
  Widget build(BuildContext context) {
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
        body: FutureBuilder<Map<String, dynamic>>(
          future: recipeDetails,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final data = snapshot.data!;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Título de la receta
                      Text(
                        data['title'],
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Imagen de la receta (85% del ancho)
                      Center(
                        child: Image.network(
                          data['image'],
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: 250, // Puedes ajustar el tamaño de la imagen aquí
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Ingredientes
                      const Text(
                        'Ingredientes:',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Mostrar ingredientes
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          data['extendedIngredients'].length,
                          (index) {
                            final ingredient = data['extendedIngredients'][index];
                            return Text(
                              '• ${ingredient['name']} (${ingredient['amount']} ${ingredient['unit']})',
                              style: const TextStyle(fontSize: 16),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Preparación
                      const Text(
                        'Preparación:',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        data['instructions'],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const Center(child: Text('No data available'));
          },
        ),
      ),
    );
  }
}
