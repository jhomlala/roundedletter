import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:rounded_letter/canvas_helper.dart';
import 'package:rounded_letter/shape.dart';
import 'package:rounded_letter/shape_configuration.dart';

class CircleShape extends Shape {
  CircleShape(ShapeConfiguration shapeConfiguration)
      : super(shapeConfiguration: shapeConfiguration);

  @override
  void draw(Canvas canvas, Size size) {
    double radius = shapeConfiguration.shapeSize / 2;
    double radiusWithBorder = radius + shapeConfiguration.borderWidth;
    if (shapeConfiguration.borderWidth > 0) {
      canvas.drawCircle(
          Offset(radiusWithBorder, radiusWithBorder),
          radiusWithBorder,
          CanvasHelper.getPaintWithColor(shapeConfiguration.borderColor));
    }
    canvas.drawCircle(Offset(radiusWithBorder, radiusWithBorder), radius,
        CanvasHelper.getPaintWithColor(shapeConfiguration.shapeColor));
    drawText(canvas);
  }
}
