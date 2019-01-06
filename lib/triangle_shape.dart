import 'dart:ui';

import 'package:rounded_letter/canvas_helper.dart';
import 'package:rounded_letter/shape.dart';
import 'package:rounded_letter/shape_configuration.dart';

class TriangleShape extends Shape {
  TriangleShape(ShapeConfiguration shapeConfiguration)
      : super(shapeConfiguration: shapeConfiguration);

  @override
  void draw(Canvas canvas, Size size) {
    if (shapeConfiguration.borderWidth > 0) {
      canvas.drawPath(
          CanvasHelper.getTrianglePath(shapeConfiguration.shapeSize, 0),
          CanvasHelper.getPaintWithColor(shapeConfiguration.borderColor));
    }
    canvas.drawPath(
        CanvasHelper.getTrianglePath(
            shapeConfiguration.shapeSize, shapeConfiguration.borderWidth),
        CanvasHelper.getPaintWithColor(shapeConfiguration.shapeColor));
    drawText(canvas);
  }

  @override
  double getTextOffsetY(double height) {
    // TODO: implement getTextOffsetY
    return super.getTextOffsetY(height) + height/4;
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
