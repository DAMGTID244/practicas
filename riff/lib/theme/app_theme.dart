import 'package:flutter/material.dart';

/// Paleta inspirada en madera de guitarra y luces de escenario.
class AppColors {
  static const Color fondo = Color(0xFF150D0A);
  static const Color superficie = Color(0xFF241711);
  static const Color primario = Color(0xFFFFB347); // ámbar de escenario
  static const Color secundario = Color(0xFFD2542B); // cobre
  static const Color textoSuave = Color(0xFFC9B8AA);
}

class AppTheme {
  static ThemeData get oscuro {
    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.fondo,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primario,
        secondary: AppColors.secundario,
        surface: AppColors.superficie,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.fondo,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w900,
          letterSpacing: 3,
          color: Colors.white,
        ),
      ),
      textTheme: base.textTheme.apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
    );
  }
}
