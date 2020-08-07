import 'package:flutter/material.dart';

class BottomCLipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.4);
    // path.lineTo(0, size.height);
    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, 0);
    path.quadraticBezierTo(
      size.width * 0.1,
      size.height * 0.4,
      size.width * 0.25,
      size.height * 0.53,
    );
    path.quadraticBezierTo(
      size.width * 0.4,
      size.height * 0.65,
      size.width * 0.5,
      size.height * 0.7,
    );
    path.quadraticBezierTo(
      size.width * 0.85,
      size.height * 0.9,
      size.width,
      0,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
    // return oldClipper == BottomCLipper() ? false : true;
  }
}
