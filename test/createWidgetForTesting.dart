import 'package:flutter/material.dart';


// Widget for testing widgets builds
Widget createWidgetForTesting(Widget child){
  return MaterialApp(
    home: child,
  );
}