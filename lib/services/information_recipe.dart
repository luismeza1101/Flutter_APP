import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchInformationRecipe(int recipeId) async {
  const apiKey = "14caa9feceae4bd18d62ba658068d614";
  final response = await http.get(Uri.parse(
      'https://api.spoonacular.com/recipes/${recipeId.toString()}/information?apiKey=$apiKey'));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);

    return {
      'extendedIngredients': (data['extendedIngredients'] as List).map((ingredient) {
        return {
          'name': ingredient['name'],
          'amount': ingredient['amount'],
          'unit': ingredient['unit'],
        };
      }).toList(),
      'title': data['title'],
      'image': data['image'],
      'instructions': data['instructions'],
    };
  } else {
    throw Exception('Error al obtener las recetas específicas');
  }
}
