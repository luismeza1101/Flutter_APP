import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/filter_acordion.dart';

class OptionsSearch extends StatefulWidget {
  const OptionsSearch({super.key});

  @override
  State<OptionsSearch> createState() => _OptionsSearchState();
}

class _OptionsSearchState extends State<OptionsSearch> {
  bool _isExpanded = false;

  void _openFilter() {
    setState(() {
      _isExpanded = true;
    });
  }

  void _closeFilters() {
    setState(() {
      _isExpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
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
              onPressed: _openFilter,
              child: const Text('Filter'),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        FilterAcordion(isExpanded: _isExpanded, closeFilters: _closeFilters,)
      ],
    );
  }
}
