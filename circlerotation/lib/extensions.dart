import 'package:circlerotation/main.dart';
import 'package:flutter/material.dart';

extension ToPath on CircleSide {
  Path toPath(Size size) {
    final path = Path();
    late Offset offset;
    late bool clockwise;

    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);

        clockwise = false;

        break;
      case CircleSide.right:
        path.moveTo(0, 0);
        offset = Offset(0, size.height);

        clockwise = true;
        break;
    }

    path.arcToPoint(
      offset,
      radius: Radius.elliptical(size.width / 2, size.height / 2),
      largeArc: true,
      clockwise: clockwise,
    );

    path.close();

    return path;
  }
}
