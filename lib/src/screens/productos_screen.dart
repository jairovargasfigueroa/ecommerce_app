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
import 'package:ecommerce_app/src/controllers/api_service.dart';
import 'package:ecommerce_app/src/core/shared_preferences_utils.dart';
import 'package:flutter/material.dart';
// import '../controllers/producto_service.dart';

class ProductListPage extends StatefulWidget {
  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  // final ProductService productService = ProductService();
  // int carritoCount = 0;
  List<dynamic> carritoList = List.empty(growable: true);

  void agregarAlCarrito(dynamic item) {
    // ApiService.instance
    //     .requestApi<List<dynamic>>(url: '/api/productos/')
    //     .then(print);
    setState(() {
      carritoList.add(item);
      SharedPreferencesUtils.setItem('carrito', carritoList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
        actions: [
          IconButton(
            icon: Row(
              children: [
                Text('${carritoList.length}'),
                IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed('/Carrito', arguments: carritoList);
                    },
                    icon: Icon(Icons.shopping_cart))
              ],
            ),
            // color: Colors.red,
            // iconSize: 30.0,
            onPressed: () {
              print('Icon button pressed');
            },
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton.small(
      //   onPressed: funt,
      //   child: Icon(Icons.star),
      // ),
      body: FutureBuilder<dynamic>(
        future: ApiService.instance.requestApi<dynamic>(url: '/api/productos/'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay productos'));
          }

          // print('DATA: ${snapshot.data}');
          final productos = snapshot.data!['results'];
          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context, index) {
              final item = productos[index];
              return ListTileWidget(
                // tile: TextButton(onPressed: funt, child: Text(p['nombre'])),
                tile: ProductoItemWidget(
                  title: item['nombre'],
                  subtitle: 'Precio: \$${item['precio']}',
                  trailing: IconButton(
                    icon: Icon(Icons.add_circle),
                    // color: Colors.red,
                    // iconSize: 30.0,
                    onPressed: () {
                      agregarAlCarrito(item);
                    },
                  ),
                ),
                // tile: ProductoItemWidget(
                //     item: p,
                //     trailing: IconButton(
                //       icon: Icon(Icons.add_circle),
                //       // color: Colors.red,
                //       // iconSize: 30.0,
                //       onPressed: agregarAlCarrito,
                //     )),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductoItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget trailing;
  const ProductoItemWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: trailing,
    );
  }
}

class ListTileWidget extends StatelessWidget {
  final Widget tile;
  const ListTileWidget({super.key, required this.tile});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.max,
      children: [
        Text('Item'),
        tile,
      ],
    );
  }
}
