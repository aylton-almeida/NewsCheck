// Class containing relevant alerts
import 'package:flutter/material.dart';

abstract class Alerts {
  static void showAlertDialog(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Testing'),
        );
      });

  static void showSnackBar(GlobalKey<ScaffoldState> scaffoldKey, String text, {Color color, SnackBarAction action}) {
    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: color ?? Colors.blueGrey,
      action: action,

    );

    scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
