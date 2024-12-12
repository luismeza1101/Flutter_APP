import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/recipes_by_name.dart';

class OptionsSearch extends StatefulWidget {
  final Function(List<Map<String, dynamic>>) onSearch;
  const OptionsSearch({super.key, required this.onSearch});

  @override
  State<OptionsSearch> createState() => _OptionsSearchState();
}

class _OptionsSearchState extends State<OptionsSearch> {
  final TextEditingController _controller = TextEditingController();

  void _search() async {
    final query = _controller.text; 
    final fetchedRecipes = await fetchSpecificRecipes(query);
    widget.onSearch(fetchedRecipes);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'Busca tu comida...',
                  prefixIcon: const Icon(Icons.search, color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                _search();
              },
              child: const Text('Buscar'),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
