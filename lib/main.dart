import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practice/Screens/Home.dart';

Future<void> main() async {

  // needed if you intend to initialize in the `main` function
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0XFFe5fbff), // navigation bar color
    statusBarColor: Color(0XFFe5fbff), // status bar color
    statusBarIconBrightness: Brightness.dark
  ));

  runApp(MyApp());

}