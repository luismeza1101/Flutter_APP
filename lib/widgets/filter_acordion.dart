import 'package:flutter/material.dart';

class FilterAcordion extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback closeFilters;

  const FilterAcordion(
      {super.key, required this.isExpanded, required this.closeFilters});

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: Container(),
      secondChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFiltroField(label: 'Incluir Ingredientes'),
          const SizedBox(height: 10),
          _buildFiltroField(label: 'Excluir Ingredientes'),
          const SizedBox(height: 10),
          _buildFiltroField(label: 'Tipo de Dieta'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: closeFilters,
            child: const Text('Aplicar Filtros'),
          ),
        ],
      ),
      crossFadeState:
          isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 300), // Duración de la animación
    );
  }

  Widget _buildFiltroField({required String label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            hintText: 'Escribe aquí...',
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
