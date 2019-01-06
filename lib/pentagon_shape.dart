import 'dart:math';
import 'dart:ui';

import 'package:rounded_letter/canvas_helper.dart';
import 'package:rounded_letter/shape.dart';
import 'package:rounded_letter/shape_configuration.dart';

class PentagonShape extends Shape {
  PentagonShape(ShapeConfiguration shapeConfiguration)
      : super(shapeConfiguration: shapeConfiguration);

  @override
  void draw(Canvas canvas, Size size) {
    if (shapeConfiguration.borderWidth > 0) {
      canvas.drawPath(
          CanvasHelper.getPolygonalPath(shapeConfiguration.shapeSize, 0, 5),
          CanvasHelper.getPaintWithColor(shapeConfiguration.borderColor));
    }
    canvas.drawPath(
        CanvasHelper.getPolygonalPath(
            shapeConfiguration.shapeSize, shapeConfiguration.borderWidth, 5),
        CanvasHelper.getPaintWithColor(shapeConfiguration.shapeColor));
    drawText(canvas);
  }

  @override
  double getTextOffsetY(double height) {
    if (shapeConfiguration.text.length == 2) {
      return super.getTextOffsetY(height) - height / 5;
    } else {
      return super.getTextOffsetY(height);
    }
  }
  @override
  double getTextOffsetX(double width) {
    if (shapeConfiguration.text.length == 2) {
      return super.getTextOffsetX(width) - width / 8;
    } else {
      return super.getTextOffsetX(width);
    }
  }
}
