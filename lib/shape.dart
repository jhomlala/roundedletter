import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:rounded_letter/canvas_helper.dart';
import 'package:rounded_letter/shape_configuration.dart';

abstract class Shape {
  Shape({@required this.shapeConfiguration});

  final ShapeConfiguration shapeConfiguration;

  void draw(Canvas canvas, Size size);

  drawText(Canvas canvas){
    TextSpan textSpan = CanvasHelper.setupTextSpan(shapeConfiguration.fontColor,
        shapeConfiguration.fontSize, shapeConfiguration.text);
    TextPainter textPainter = CanvasHelper.setupTextPainter(textSpan);
    textPainter.layout();
    textPainter.paint(
        canvas,
        new Offset(getTextOffsetX(textPainter.width),
            getTextOffsetY(textPainter.height)));
  }

  double getTextOffsetX(double width) {
    return shapeConfiguration.shapeSize / 2 + shapeConfiguration.borderWidth - width / 2;
  }

  double getTextOffsetY(double height) {
    return shapeConfiguration.shapeSize / 2 + shapeConfiguration.borderWidth - height / 2;
  }
}
