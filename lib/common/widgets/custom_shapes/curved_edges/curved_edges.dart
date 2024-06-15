import 'package:flutter/material.dart';

class TCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final firstCurve = Offset(0, size.height - 20);
    final firstCurve2 = Offset(30, size.height - 20);
    path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, firstCurve2.dx, firstCurve2.dy);

    final secondCurve = Offset(0, size.height - 20);
    final secondCurve2 = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(secondCurve.dx, secondCurve.dy, secondCurve2.dx, secondCurve2.dy);

    final thirdCurve = Offset(size.width, size.height - 20);
    final thirdCurve2 = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdCurve.dx, thirdCurve.dy, thirdCurve2.dx, thirdCurve2.dy);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}