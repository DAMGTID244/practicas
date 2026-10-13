/// Modelo de datos de una guitarra (o instrumento de cuerda similar).
class Guitarra {
  final String nombre;
  final String categoria; // Acústicas, Clásicas, Eléctricas, Otros
  final String descripcionCorta;
  final String descripcionLarga;
  final String imagen;
  final String cuerdas;
  final String origen;
  final String precio;
  final int dificultad; // 1 a 5
  final String maderas;
  final String estiloIdeal;
  final String datoCurioso;

  const Guitarra({
    required this.nombre,
    required this.categoria,
    required this.descripcionCorta,
    required this.descripcionLarga,
    required this.imagen,
    required this.cuerdas,
    required this.origen,
    required this.precio,
    required this.dificultad,
    required this.maderas,
    required this.estiloIdeal,
    required this.datoCurioso,
  });
}
