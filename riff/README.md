# RIFF – Guía interactiva de guitarras

App móvil en Flutter con tres pantallas: Splash, Home (búsqueda, chips y lista) y Detalle (Hero, ficha técnica y botones de acción).

## Cómo ejecutarla

1. Instala Flutter (versión 3.27 o superior recomendada).
2. En esta carpeta ejecuta, **una sola vez**, para generar las carpetas de Android/iOS:
   ```
   flutter create . --project-name riff
   ```
   (No sobrescribe `lib/`, `assets/` ni `pubspec.yaml`.)
3. Instala dependencias y corre:
   ```
   flutter pub get
   flutter run
   ```

## Estructura

```
lib/
├── main.dart
├── models/guitarra.dart          # Modelo de datos
├── data/guitarras_data.dart      # Mock data (8 instrumentos)
├── screens/
│   ├── splash_screen.dart
│   ├── home_screen.dart
│   └── detail_screen.dart
├── widgets/
│   ├── guitarra_card.dart
│   ├── categoria_chips.dart
│   └── info_tile.dart
└── theme/app_theme.dart
assets/images/                    # Ilustraciones locales
```

## Qué cumple de la tarea

- Splash: logo, `CircularProgressIndicator` y paso automático a los 3 segundos.
- Home: `AppBar` con ícono de perfil, buscador funcional, chips de categoría y `ListView.builder` con `Card`.
- Detalle: datos pasados por constructor, imagen con `Hero`, ficha con íconos y botones Favorito/Compartir.
- El estado de favorito regresa a Home con `Navigator.pop(context, valor)` y se recibe con `await`.
