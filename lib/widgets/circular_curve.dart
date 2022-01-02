import 'package:flutter/material.dart';

class ClipperCurve extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0,4/5*size.height);
    Offset centrePt = Offset(size.width/2, size.height);
    Offset endPt = Offset(size.width, 4/5 * size.height);
    path.quadraticBezierTo(centrePt.dx, centrePt.dy, endPt.dx, endPt.dy);
    path.lineTo(size.width,0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}