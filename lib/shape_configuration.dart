import 'dart:ui';

import 'package:meta/meta.dart';
import 'package:rounded_letter/shape_type.dart';

class ShapeConfiguration {
  ShapeConfiguration({
    @required this.shapeType,
    @required this.shapeColor,
    @required this.fontColor,
    @required this.shapeSize,
    @required this.text,
    @required this.fontSize,
    @required this.borderWidth,
    @required this.borderColor,
  });

  final ShapeType shapeType;
  final Color shapeColor;
  final Color fontColor;
  final double shapeSize;
  final String text;
  final double fontSize;
  final double borderWidth;
  final Color borderColor;
}