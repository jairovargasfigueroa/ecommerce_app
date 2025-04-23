import 'package:ecommerce_app/src/widget/ItemListWidget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int id = 10;
  late List<String> list;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = [];
    // ApiService.instance.requestApi(
    //     url: '/api/usuarios/login/',
    //     method: 'POST',
    //     body: {'username': 'cliente1', 'password': '123456'}).then((res) {
    //   print('RESP $res');
    // });
  }

  Future<void> myFunction() async {
    // print('ITEM $item');
    setState(() {
      this.id = 100;
      this.list = ["Hello", "Worl"];
    });
  }

  @override
  Widget build(BuildContext context) {
    print('RENDER BUILD');
    return Scaffold(
      appBar: AppBar(
        title: Text('My Screen'),
      ),
      body: Column(
        children: [
          Text('ID: $id'),
          Text('LIST: ${list?.length}'),
          TextButton(onPressed: myFunction, child: Text('CLICK')),
          MyWidget(id: id, list: list),
        ],
      ),
    );
    return ItemListWidget(config: {
      'api': '/api/pedidos/?page=1',
      // 'actions':
      //   TextButton(
      //       onPressed: () => myFunction({'field': '2'} as dynamic),
      //       child: Text('Click'))
      // ,
      'fields': [
        {'prop': 'usuario', 'default': '', 'label': 'Usuario'},
        {'prop': 'monto_total', 'default': '0', 'label': 'Monto Total:'},
        {'prop': 'estado', 'default': 'Desconocido', 'label': 'Estado:'},
      ]
    });
    // return ItemListWidget(config: {
    //   'api': '/api/productos/?page=1',
    //   'imgLeading': 'imagen',
    //   // 'imgTrailing': 'imagen',
    //   'fields': [
    //     {'prop': 'nombre', 'default': 'Sin Texto', 'label': ''},
    //     {'prop': 'precio', 'default': '', 'label': 'Precio'},
    //     {'prop': 'stock', 'default': '', 'label': 'Stock'},
    //     {'prop': 'descripcion', 'default': '', 'label': 'Descripcion'}
    //   ]
    // });
    // return Scaffold(
    //   appBar: AppBar(title: Text('Catálogo de Slides')),
    //   body: FutureBuilder(
    //     future: ApiService.instance.requestApi(url: '/api/productos/?page=1'),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Center(child: CircularProgressIndicator());
    //       }
    //       if (snapshot.hasError) {
    //         return Center(child: Text('Error: ${snapshot.error}'));
    //       }

    //       final slides = snapshot.data!;
    //       return ListView.builder(
    //         itemCount: slides.length,
    //         itemBuilder: (context, index) {
    //           final slide = slides[index];
    //           // final media = slide['media'] != null && slide['media'].length > 0
    //           //     ? slide['media'][0]['url']
    //           //     : null;

    //           return Card(
    //             margin: EdgeInsets.all(10),
    //             child: ListTile(
    //               title: Text(slide['nombre'] ?? 'Sin texto'),
    //               subtitle: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text('Precio: ${slide['precio']}'),
    //                   Text('Stock: ${slide['stock']}'),
    //                   Text('Descipción: ${slide['descipcion']}'),
    //                   TextButton(
    //                       onPressed: () {
    //                         print('Press');
    //                       },
    //                       child: Text('Click Me')),
    //                 ],
    //               ),
    //               isThreeLine: true,
    //             ),
    //           );
    //         },
    //       );
    //     },
    //   ),
    // );
  }
}

const listConfig = {
  'api': '/api/productos/?page=1',
  'fields': [
    {'prop': 'nombre', 'default': 'Sin Texto', 'label': ''},
    {'prop': 'precio', 'default': '', 'label': 'Precio'},
    {'prop': 'stock', 'default': '', 'label': 'Stock'},
    {'prop': 'descripcion', 'default': '', 'label': 'Descripcion'}
  ]
};

class MyWidget extends StatelessWidget {
  final int id;
  final List<String> list;

  const MyWidget({super.key, required this.id, required this.list});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text('Stalesss'),
            Text('ID: $id'),
            Text('LIST: ${list.length}'),
          ],
        )
      ],
    );
  }
}
