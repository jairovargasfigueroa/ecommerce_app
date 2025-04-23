import 'dart:io';

import 'package:ecommerce_app/src/controllers/api_service.dart';
import 'package:flutter/material.dart';

import 'route_generator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // HttpOverrides.global = new MyHttpOverrides();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // settingRepo.initSettings();
    // settingRepo.getCurrentLocation();
    // userRepo.getCurrentUser();
    super.initState();
    // ApiService.instance.requestApi(
    //     url: '/api/usuarios/login/',
    //     method: 'POST',
    //     body: {'username': 'cliente1', 'password': '123456'}).then((res) {
    //   print('RESP $res');
    // });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Brightness.light;
    //TODO: app.module
    return MaterialApp(
        // navigatorKey: settingRepo.navigatorKey,
        title: 'App',
        initialRoute: '/Splash',
        //TODO: app.routing
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        // locale: _setting.mobileLanguage.value,
        theme: theme == Brightness.light
            ? ThemeData(
                primaryColor: Colors.white,
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    elevation: 0, foregroundColor: Colors.white),
                brightness: Brightness.light,
                // dividerColor: config.Colors().accentColor(0.1),
                // focusColor: config.Colors().accentColor(1),
                // hintColor: config.Colors().secondColor(1),
              )
            : ThemeData(
                // fontFamily: 'Poppins',
                primaryColor: Color(0xFF252525),
                brightness: Brightness.dark,
                scaffoldBackgroundColor: Color(0xFF2C2C2C),
                // dividerColor: config.Colors().accentColor(0.1),
                // hintColor: config.Colors().secondDarkColor(1),
                // focusColor: config.Colors().accentDarkColor(1),
              ));
  }
}
