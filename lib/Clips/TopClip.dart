

import 'package:flutter/material.dart';

class TopClip extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

    final path = Path();

    // Right Portion
    path.moveTo(size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width/2, size.width);

    // left Portion
    path.moveTo(0.0, size.height);
    path.lineTo(size.width/2, size.height);
    path.lineTo(size.width/2, size.width);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}