import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/UI/Login.dart';
import 'package:flutter_practice/Utils/ColorConstant.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    /*Future.delayed(Duration(seconds: 3)).whenComplete(() => {
      Navigator.pushReplacement(_buildContext,
      MaterialPageRoute(builder: (context)=> LoginScreen()))
    });*/
  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      themeMode: ThemeMode.dark,
      scrollBehavior: ScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (BuildContext context) {

          Future.delayed(Duration(seconds: 3)).whenComplete(() => {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context)=> LoginScreen()))
          });

          return Scaffold(
              backgroundColor:  ColorsConstant.beige.withOpacity(1),
              body:Stack(
                children: [
                  /*ClipPath(
              clipper: TopLeft(),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          ColorsConstant.light_blue.withOpacity(0.5),
                          ColorsConstant.rosy_brown.withOpacity(0.5)
                        ]
                    )
                ),
              ),
            ),*/

                  ClipPath(
                    clipper: BGMainClip(),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                ColorsConstant.silver.withOpacity(0.1),
                                ColorsConstant.beige.withOpacity(1)
                              ]
                          )
                      ),
                    ),
                  ),

                  ClipPath(
                    clipper: BottomRight(),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                ColorsConstant.dark_red.withOpacity(0.1),
                                ColorsConstant.gold.withOpacity(0.2)
                              ]
                          )
                      ),
                    ),
                  )
                ],
              )
          );
        },
      ),
    );
  }
}


class TopLeft extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final path = Path();
    path
      ..quadraticBezierTo(size.width + 50, size.height/2, size.width + 200, -50)
      ..computeMetrics(forceClosed: true)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BGMainClip extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final path = Path();
    path
      ..quadraticBezierTo(
          -size.width/2,
          size.width * (size.width) ,
          size.width,
          0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BottomRight extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final path = Path();
    path
    ..quadraticBezierTo(size.height/2 , 0, 0, size.height )
    ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}