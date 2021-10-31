

import 'package:flutter/material.dart';
import 'package:flutter_practice/Utils/ColorConstant.dart';
import 'package:get/get.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen() : super();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: ColorsConstant.cadet_blue.withOpacity(0.5),
        body: Container(),
      ),
    );
  }
}
