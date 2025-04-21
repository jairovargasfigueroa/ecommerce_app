// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../core/constants.dart';
// import '../models/producto.dart';

// class ProductoService {
//   static Future<List<Producto>> getProductos() async {
//     print('Llamando a getProductos()');
//     final response = await http.get(Uri.parse('$baseUrl/productos/'));
//     print('Productos recibidos: $response');

//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);
//       return data.map((json) => Producto.fromJson(json)).toList();
//     } else {
//       throw Exception('Error al cargar productos');
//     }
//   }
// }

// lib/services/product_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/constants.dart';

class ProductService {
  Future<List<dynamic>> fetchProducts() async {
    final url = Uri.parse('$baseUrl/productos/');
    final response = await http.get(url);
    print('Response status: $response');

    if (response.statusCode == 200) {
      print("Entro al if");
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      print("Entro al else");
      throw Exception('Error al cargar productos');
    }
  }
}
