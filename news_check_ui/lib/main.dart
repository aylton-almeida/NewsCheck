import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:news_check/routes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Routes();
}
