import 'package:flutter/material.dart';

class TCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
      0,
      size.height - 20,
      30,
      size.height - 20,
    );
    path.quadraticBezierTo(
      30,
      size.height - 20,
      size.width / 2 - 60,
      size.height - 20,
    );
    path.quadraticBezierTo(
      0,
      size.height - 20,
      size.width - 30,
      size.height - 20,
    );
    path.quadraticBezierTo(
      size.width,
      size.height - 20,
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
