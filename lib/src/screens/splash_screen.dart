import 'package:ecommerce_app/src/controllers/api_service.dart';
import 'package:ecommerce_app/src/core/shared_preferences_utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // loadData();
    // print('AUTHS INTI');
    ApiService.instance.requestApi(
        url: '/api/usuarios/login/',
        method: 'POST',
        body: {'username': 'cliente1', 'password': '123456'}).then((res) {
      // print('AUTHS $res');
      SharedPreferencesUtils.setItem('token', res['access']).then((resp) {
        try {
          Navigator.of(context).pushReplacementNamed('/Home', arguments: 0);
        } catch (ignore) {}
      }).catchError((onError) {});
    }).catchError((onError) {
      // print('ERR $onError');
    });
  }

  // void loadData() {
  //   Future.delayed(Duration(seconds: 1)).then((resp) {
  //     try {
  //       Navigator.of(context).pushReplacementNamed('/Home', arguments: 0);
  //     } catch (ignore) {}
  //   }).catchError((onError) {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _con.scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                'https://img.freepik.com/vector-gratis/diseno-logotipo-tienda-movil-degradado_23-2149699842.jpg?semt=ais_hybrid&w=740',
                width: 150,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 50),
              CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(Theme.of(context).hintColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
