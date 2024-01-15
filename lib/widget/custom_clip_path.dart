import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    double w= size.width;
    double h = size.height;
    Path path = Path();
    path.lineTo(0, h);
    path.quadraticBezierTo(w*0.5, h, w, h);
    path.lineTo(w, 0);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}