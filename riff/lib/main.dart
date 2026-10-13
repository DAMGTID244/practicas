import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';
import 'theme/app_theme.dart';

void main() => runApp(const RiffApp());

class RiffApp extends StatelessWidget {
  const RiffApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RIFF - Guía de guitarras',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.oscuro,
      home: const SplashScreen(),
    );
  }
}
