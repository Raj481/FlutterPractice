
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CirculerPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    var paint1 = Paint()
      ..color = const Color(0XFF50000000)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    var paint2 = Paint()
      ..color = Color(0XFFe5fbff) //Color(0xff113a83)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(size.width/2, size.height/2), 100, paint1);
    canvas.drawCircle(Offset(size.width/2, size.height/2), 98, paint2);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
    // throw UnimplementedError();
  }

  void _drawBackground(Canvas canvas, Rect shapeBounds, Rect avatarBounds) {
    //1
    final paint = Paint()..color = Colors.black;

    //2
    var backgroundPath = Path()
      ..moveTo(shapeBounds.left, shapeBounds.top) //3
      ..lineTo(shapeBounds.bottomLeft.dx, shapeBounds.bottomLeft.dy) //4
      ..arcTo(avatarBounds, -pi, pi, false) //5
      ..lineTo(shapeBounds.bottomRight.dx, shapeBounds.bottomRight.dy) //6
      ..lineTo(shapeBounds.topRight.dx, shapeBounds.topRight.dy) //7
      ..close(); //8

    //9
    canvas.drawPath(backgroundPath, paint);
  }


}