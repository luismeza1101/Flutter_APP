import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> fetchSpecificRecipes(String query) async {
  const apiKey = "14caa9feceae4bd18d62ba658068d614";
  final response = await http.get(Uri.parse(
      'https://api.spoonacular.com/recipes/complexSearch?apiKey=$apiKey&query=$query'));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    List<Map<String, dynamic>> recipes =
        (data['results'] as List).map((recipe) {
      return {
        'id': recipe['id'],
        'title': recipe['title'],
        'image': recipe['image'],
      };
    }).toList();

    return recipes;
  } else {
    throw Exception('Error al obtener las recetas específicas');
  }
}
