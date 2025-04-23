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
