
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    var paint = Paint()
      ..color = const Color(0XFFe5fbff)
      ..style = PaintingStyle.fill;

    var path = Path()
      ..moveTo(0, size.height * 0.9167)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.875,
          size.width * 0.5, size.height * 0.9167)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.9584,
          size.width * 1.0, size.height * 0.9167)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

   /* var path2 = Path()
      ..moveTo(0, size.height * 0.9167)
      ..quadraticBezierTo(
          size.width * 0.25, size.height * 0.875,
          size.width * 0.5, size.height * 0.9167)
      ..quadraticBezierTo(
          size.width * 0.75, size.height * 0.9584,
          size.width * 1.0, size.height * 0.9167)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);*/

    canvas.drawPath(path, paint);
   // canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}