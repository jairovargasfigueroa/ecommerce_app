class Producto {
  final String id;
  final String nombre;
  final String descripcion;
  final double precio;
  final String? imagen;
  final String stock;

  Producto({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    this.imagen,
    required this.stock,
  });

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      id: json['id'].toString(),
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      precio: double.parse(json['precio'].toString()),
      imagen: json['imagen'],
      stock: json['stock'].toString(),
    );
  }
}
