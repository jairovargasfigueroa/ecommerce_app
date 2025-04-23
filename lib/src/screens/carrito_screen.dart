import 'package:ecommerce_app/src/core/shared_preferences_utils.dart';
import 'package:flutter/material.dart';

class CarritoWidget extends StatefulWidget {
  final List<dynamic> carritoList;
  const CarritoWidget({super.key, required this.carritoList});

  @override
  State<CarritoWidget> createState() => _CarritoWidgetState();
}

class _CarritoWidgetState extends State<CarritoWidget> {
  List<dynamic> carritoList = List.empty();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('CARRITO LENGTH: ${widget.carritoList.length}');
    SharedPreferencesUtils.getItem('carrito').then((spValue) {
      setState(() {
        carritoList = spValue;
      });
    }).catchError((err) {
      print('ERR $err');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito'),
      ),
      body: Column(
        children: [
          Text('Carrito SP has: ${carritoList.length}'),
          Text('Carrito has: ${widget.carritoList.length}'),
        ],
      ),
    );
  }
}
