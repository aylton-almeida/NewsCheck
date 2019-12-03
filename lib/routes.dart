import 'package:flutter/material.dart';
import 'package:news_check/screens/HomeScreen/index.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
    '/': (context) => HomeScreen(),
  };

  final appTheme = ThemeData(
    primaryColor: Color(0xFFDDDDDD),
    accentColor: Color(0xFF2C4495),
    cursorColor: Color(0xFF2C4495),
    buttonColor: Color(0xFF2C4495),
    textSelectionColor: Color(0xFF2C4495),
    textSelectionHandleColor: Color(0xFF2C4495),
  );

  Routes() {
    runApp(MaterialApp(
      title: 'NewsCheck',
      initialRoute: '/',
      theme: appTheme,
      routes: routes,
    ));
  }
}
