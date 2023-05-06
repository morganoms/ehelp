import 'package:flutter/material.dart';

class CustomCornerClipPath extends CustomClipper<Path> {
  final double cornerR;
  const CustomCornerClipPath({this.cornerR = 16.0});

  @override
  Path getClip(Size size) => Path()
    ..lineTo(size.width, 0)
    ..lineTo(size.width, size.height)
    ..arcToPoint(
      Offset(
        size.width - cornerR,
        size.height - 30,
      ),
      radius: Radius.circular(1),
      clockwise: false,
    )
    ..lineTo(
      0 + cornerR,
      size.height - 30,
    )
    ..arcToPoint(
      Offset(
        0,
        size.height - cornerR,
      ),
      radius: Radius.circular(1),
      clockwise: false,
    );
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
