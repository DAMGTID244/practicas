import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Fila horizontal de chips para filtrar por categoría.
class CategoriaChips extends StatelessWidget {
  final List<String> categorias;
  final String seleccionada;
  final ValueChanged<String> onSeleccion;

  const CategoriaChips({
    super.key,
    required this.categorias,
    required this.seleccionada,
    required this.onSeleccion,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categorias.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final cat = categorias[i];
          final activa = cat == seleccionada;
          return ChoiceChip(
            label: Text(cat),
            selected: activa,
            showCheckmark: false,
            selectedColor: AppColors.primario,
            backgroundColor: AppColors.superficie,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w700,
              color: activa ? Colors.black : Colors.white,
            ),
            side: BorderSide(
              color: activa ? AppColors.primario : Colors.white24,
            ),
            onSelected: (_) => onSeleccion(cat),
          );
        },
      ),
    );
  }
}
