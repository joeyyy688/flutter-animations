import 'package:circlerotation/extensions.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class HalfCircleClipper extends CustomClipper<Path> {
  final CircleSide side;

  HalfCircleClipper(this.side);

  @override
  Path getClip(Size size) {
    // implement getClip
    return side.toPath(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
