import 'dart:async';

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'home_screen.dart';

/// Pantalla de bienvenida: logo animado y paso automático a Home en 3 s.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 700),
          pageBuilder: (_, __, ___) => const HomeScreen(),
          transitionsBuilder: (_, animation, __, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.3),
            radius: 1.0,
            colors: [Color(0xFF4A2A14), AppColors.fondo],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.6, end: 1.0),
                duration: const Duration(milliseconds: 1200),
                curve: Curves.easeOutBack,
                builder: (context, value, child) => Opacity(
                  opacity: value.clamp(0.0, 1.0),
                  child: Transform.scale(scale: value, child: child),
                ),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 220,
                  height: 220,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'RIFF',
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 10,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Encuentra la guitarra que suena a ti',
                style: TextStyle(fontSize: 15, color: AppColors.textoSuave),
              ),
              const SizedBox(height: 48),
              const SizedBox(
                width: 36,
                height: 36,
                child: CircularProgressIndicator(
                  strokeWidth: 3.5,
                  color: AppColors.primario,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Afinando cuerdas...',
                style: TextStyle(fontSize: 13, color: AppColors.textoSuave),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
