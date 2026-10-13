import 'package:flutter/material.dart';

import '../data/guitarras_data.dart';
import '../models/guitarra.dart';
import '../theme/app_theme.dart';
import '../widgets/categoria_chips.dart';
import '../widgets/guitarra_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _busqueda = '';
  String _categoria = 'Todos';
  final Set<String> _favoritas = {};

  List<Guitarra> get _filtradas {
    return guitarras.where((g) {
      final coincideCategoria = _categoria == 'Todos' || g.categoria == _categoria;
      final texto = _busqueda.toLowerCase();
      final coincideBusqueda = texto.isEmpty ||
          g.nombre.toLowerCase().contains(texto) ||
          g.descripcionCorta.toLowerCase().contains(texto);
      return coincideCategoria && coincideBusqueda;
    }).toList();
  }

  /// Abre el detalle enviando el objeto y espera (async) el resultado
  /// que la pantalla de detalle devuelve con Navigator.pop(context, valor).
  Future<void> _abrirDetalle(Guitarra g) async {
    final esFavorita = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => DetailScreen(
          guitarra: g,
          esFavoritaInicial: _favoritas.contains(g.nombre),
        ),
      ),
    );
    if (esFavorita == null) return;
    setState(() {
      if (esFavorita) {
        _favoritas.add(g.nombre);
      } else {
        _favoritas.remove(g.nombre);
      }
    });
  }

  void _mostrarPerfil() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.superficie,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 36,
              backgroundColor: AppColors.primario,
              child: Icon(Icons.person, size: 40, color: Colors.black),
            ),
            const SizedBox(height: 12),
            const Text(
              'Mi perfil',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 6),
            Text(
              '${_favoritas.length} guitarras favoritas',
              style: const TextStyle(color: AppColors.textoSuave),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lista = _filtradas;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/logo.png', width: 38, height: 38),
            const SizedBox(width: 8),
            const Text('RIFF'),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Perfil',
            icon: const Icon(Icons.account_circle_outlined, size: 30),
            onPressed: _mostrarPerfil,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 14),
            child: TextField(
              onChanged: (v) => setState(() => _busqueda = v),
              decoration: InputDecoration(
                hintText: 'Buscar guitarra...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: AppColors.superficie,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          CategoriaChips(
            categorias: categorias,
            seleccionada: _categoria,
            onSeleccion: (c) => setState(() => _categoria = c),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: lista.isEmpty
                ? const Center(
                    child: Text(
                      'No encontramos guitarras con ese nombre',
                      style: TextStyle(color: AppColors.textoSuave),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      final g = lista[i];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: GuitarraCard(
                          guitarra: g,
                          esFavorita: _favoritas.contains(g.nombre),
                          onTap: () => _abrirDetalle(g),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
