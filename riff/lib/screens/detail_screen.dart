import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/guitarra.dart';
import '../theme/app_theme.dart';
import '../widgets/info_tile.dart';

class DetailScreen extends StatefulWidget {
  final Guitarra guitarra;
  final bool esFavoritaInicial;

  const DetailScreen({
    super.key,
    required this.guitarra,
    required this.esFavoritaInicial,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late bool _esFavorita;

  @override
  void initState() {
    super.initState();
    _esFavorita = widget.esFavoritaInicial;
  }

  void _compartir() {
    final g = widget.guitarra;
    Clipboard.setData(
      ClipboardData(text: '${g.nombre}: ${g.descripcionCorta} (vista en RIFF)'),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Texto copiado para compartir')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final g = widget.guitarra;

    // Al salir (botón atrás o gesto) se devuelve el estado de favorito a Home.
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        Navigator.pop(context, _esFavorita);
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 380,
              pinned: true,
              backgroundColor: AppColors.fondo,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  g.nombre,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                background: Hero(
                  tag: 'guitarra-${g.nombre}',
                  child: Image.asset(
                    g.imagen,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Chip(
                          label: Text(g.categoria),
                          backgroundColor: AppColors.primario,
                          labelStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ),
                          side: BorderSide.none,
                        ),
                        const Spacer(),
                        _Estrellas(valor: g.dificultad),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      g.nombre,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Dificultad para aprender: ${g.dificultad}/5',
                      style: const TextStyle(color: AppColors.textoSuave),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      g.descripcionLarga,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: AppColors.textoSuave,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Ficha técnica',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 12),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 2.1,
                      children: [
                        InfoTile(
                          icono: Icons.music_note,
                          etiqueta: 'CUERDAS',
                          valor: g.cuerdas,
                        ),
                        InfoTile(
                          icono: Icons.attach_money,
                          etiqueta: 'PRECIO APROX.',
                          valor: g.precio,
                        ),
                        InfoTile(
                          icono: Icons.public,
                          etiqueta: 'ORIGEN',
                          valor: g.origen,
                        ),
                        InfoTile(
                          icono: Icons.queue_music,
                          etiqueta: 'IDEAL PARA',
                          valor: g.estiloIdeal,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    InfoTile(
                      icono: Icons.park_outlined,
                      etiqueta: 'MADERAS',
                      valor: g.maderas,
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.superficie,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: AppColors.secundario),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.lightbulb_outline,
                            color: AppColors.primario,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              g.datoCurioso,
                              style: const TextStyle(fontSize: 14, height: 1.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    Row(
                      children: [
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: () =>
                                setState(() => _esFavorita = !_esFavorita),
                            style: FilledButton.styleFrom(
                              backgroundColor: _esFavorita
                                  ? AppColors.secundario
                                  : AppColors.primario,
                              foregroundColor:
                                  _esFavorita ? Colors.white : Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            icon: Icon(
                              _esFavorita
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                            ),
                            label: Text(
                              _esFavorita ? 'En favoritos' : 'Favorito',
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: _compartir,
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: const BorderSide(color: Colors.white38),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            icon: const Icon(Icons.share),
                            label: const Text('Compartir'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Estrellas extends StatelessWidget {
  final int valor;
  const _Estrellas({required this.valor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (i) => Icon(
          i < valor ? Icons.star : Icons.star_border,
          color: AppColors.primario,
          size: 22,
        ),
      ),
    );
  }
}
