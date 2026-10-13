import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Bloque pequeño con icono, etiqueta y valor (ej. cuerdas, precio).
class InfoTile extends StatelessWidget {
  final IconData icono;
  final String etiqueta;
  final String valor;

  const InfoTile({
    super.key,
    required this.icono,
    required this.etiqueta,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.superficie,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Icon(icono, color: AppColors.primario, size: 26),
          const SizedBox(width: 10),
          // Expanded evita el desbordamiento (RenderFlex overflow) del texto.
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  etiqueta,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textoSuave,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  valor,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
