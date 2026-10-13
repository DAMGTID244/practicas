import 'package:flutter/material.dart';

import '../models/guitarra.dart';
import '../theme/app_theme.dart';

/// Tarjeta con imagen, título y breve descripción de una guitarra.
class GuitarraCard extends StatelessWidget {
  final Guitarra guitarra;
  final bool esFavorita;
  final VoidCallback onTap;

  const GuitarraCard({
    super.key,
    required this.guitarra,
    required this.esFavorita,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.superficie,
      elevation: 6,
      shadowColor: Colors.black87,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: [
                  Hero(
                    tag: 'guitarra-${guitarra.nombre}',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: AspectRatio(
                        aspectRatio: 16 / 10,
                        child: Image.asset(
                          guitarra.imagen,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(150),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        guitarra.categoria,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primario,
                        ),
                      ),
                    ),
                  ),
                  if (esFavorita)
                    const Positioned(
                      top: 8,
                      right: 8,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.black54,
                        child: Icon(
                          Icons.favorite,
                          size: 18,
                          color: AppColors.secundario,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    guitarra.nombre,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    guitarra.descripcionCorta,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.35,
                      color: AppColors.textoSuave,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
