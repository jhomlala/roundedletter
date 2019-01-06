import 'dart:math';
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:rounded_letter/shape_configuration.dart';

class CanvasHelper {
  static Path getTrianglePath(double shapeSize, double offset) {
    Path path = Path();
    path.moveTo(shapeSize / 2, offset);
    path.lineTo(shapeSize - offset, shapeSize - offset / 2);
    path.lineTo(offset, shapeSize - offset / 2);
    path.close();
    return path;
  }

  static Path getPolygonalPath(double shapeSize, double offset, int vertices) {
    double angle = 3.141592 * 2 / vertices;
    double half = shapeSize / 2;
    double radius = half - offset;
    double centreX = half;
    double centreY = half;
    Path path = Path();
    path.moveTo(centreX, centreY);
    for (int i = 0; i < vertices + 1; i++) {
      var x = centreX + radius * sin(i * angle);
      var y = centreY + radius * cos(i * angle);
      path.lineTo(x, y);
    }
    path.close();
    return path;
  }

  static TextSpan setupTextSpan(ShapeConfiguration shapeConfiguration) {
    FontWeight fontWeight = FontWeight.normal;
    FontStyle fontStyle = FontStyle.normal;
    if (shapeConfiguration.fontBold) {
      fontWeight = FontWeight.bold;
    }
    if (shapeConfiguration.fontItalic) {
      fontStyle = FontStyle.italic;
    }

    return new TextSpan(
        style: new TextStyle(
            color: shapeConfiguration.fontColor,
            fontSize: shapeConfiguration.fontSize,
            fontStyle: fontStyle,
            fontWeight: fontWeight,
            letterSpacing: 0),
        text: shapeConfiguration.text);
  }

  static TextPainter setupTextPainter(TextSpan textSpan) {
    return new TextPainter(text: textSpan, textDirection: TextDirection.ltr);
  }

  static Paint getPaintWithColor(Color color) {
    return Paint()..color = color;
  }
}
