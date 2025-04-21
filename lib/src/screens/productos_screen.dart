// import 'package:flutter/material.dart';
// import '../models/producto.dart';
// import '../controllers/producto_service.dart';

// class ProductosScreen extends StatefulWidget {
//   @override
//   State<ProductosScreen> createState() => _ProductosScreenState();
// }

// class _ProductosScreenState extends State<ProductosScreen> {
//   late Future<List<Producto>> _productosFuture;

//   @override
//   void initState() {
//     super.initState();
//     _productosFuture = ProductService.getPro  ;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Productos')),
//       body: FutureBuilder<List<Producto>>(
//         future: _productosFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }

//           final productos = snapshot.data!;
//           return ListView.builder(
//             itemCount: productos.length,
//             itemBuilder: (context, index) {
//               final p = productos[index];
//               return Card(
//                 margin: EdgeInsets.all(10),
//                 child: ListTile(
//                   leading:
//                       p.imagen != null
//                           ? Image.network(
//                             p.imagen!,
//                             width: 60,
//                             fit: BoxFit.cover,
//                           )
//                           : Icon(Icons.image_not_supported),
//                   title: Text(p.nombre),
//                   subtitle: Text(p.descripcion),
//                   trailing: Text('\$${p.precio.toStringAsFixed(2)}'),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// lib/screens/product_list.dart
import 'package:flutter/material.dart';
import '../controllers/producto_service.dart';

class ProductListPage extends StatelessWidget {
  final ProductService productService = ProductService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Productos')),
      body: FutureBuilder<List<dynamic>>(
        future: productService.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay productos'));
          }

          final productos = snapshot.data!;
          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context, index) {
              final p = productos[index];
              return ListTile(
                title: Text(p['nombre']),
                subtitle: Text('Precio: \$${p['precio']}'),
              );
            },
          );
        },
      ),
    );
  }
}
