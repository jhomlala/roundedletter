import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rounded_letter/click_listener.dart';
import 'package:rounded_letter/color_helper.dart';
import 'package:rounded_letter/cricle_shape.dart';
import 'package:rounded_letter/hexagon_shape.dart';
import 'package:rounded_letter/pentagon_shape.dart';
import 'package:rounded_letter/rectangle_shape.dart';
import 'package:rounded_letter/shape.dart';
import 'package:rounded_letter/shape_configuration.dart';
import 'package:rounded_letter/shape_type.dart';
import 'package:rounded_letter/triangle_shape.dart';

class RoundedLetter extends StatelessWidget {
  RoundedLetter(
      {Key key,
      this.shapeType = ShapeType.circle,
      this.shapeColor = ColorHelper.defaultShapeColor,
      this.fontColor = ColorHelper.defaultFontColor,
        this.fontItalic = false,
        this.fontBold = false,
      this.shapeSize = 40,
      @required this.text,
      this.fontSize = 20,
      this.borderWidth = 0,
      this.borderColor = ColorHelper.transparent,
      this.clickListener,
      })
      : assert(!(text == null), "Invalid letter"),
        assert(!(text.length <= 1 && text.length >= 2),
            "String length must be 1 or 2"),
        assert(!(shapeSize < 0), "Shape size must be greater than 0"),
        assert(!(fontSize > shapeSize / 2),
            "Font size can't be greater than half of shape size"),
        assert(!(fontSize < 0), "Font siye must be greater than 0"),
        assert(!(shapeColor == null), "Shape color can't be null"),
        assert(!(fontColor == null), "Font color can't be null"),
        assert(!(borderWidth < 0), "Border with must be greater than 0"),
        assert(!(borderColor == null), "Border color can't be null"),
        super(key: key);

  final ShapeType shapeType;
  final Color shapeColor;
  final Color fontColor;
  final bool fontItalic;
  final bool fontBold;
  final double shapeSize;
  final String text;
  final double fontSize;
  final double borderWidth;
  final Color borderColor;
  final ClickListener clickListener;

  static Color _getRandomColor() {
    var random = new Random();
    return Color.fromARGB(255, _getRandomInt(random), _getRandomInt(random),
        _getRandomInt(random));
  }

  static int _getRandomInt(Random random) {
    return random.nextInt(255);
  }

  static RoundedLetter withRandomColors(
      String letter, double circleSize, double fontSize) {
    return new RoundedLetter(
      text: letter,
      shapeColor: _getRandomColor(),
      fontColor: _getRandomColor(),
      shapeSize: circleSize,
      fontSize: fontSize,
    );
  }

  static RoundedLetter withBlueCircle(
      String letter, double circleSize, double fontSize) {
    return new RoundedLetter(
      text: letter,
      shapeColor: ColorHelper.blue,
      shapeSize: circleSize,
      fontSize: fontSize,
    );
  }

  static RoundedLetter withGreenCircle(
      String letter, double circleSize, double fontSize) {
    return new RoundedLetter(
      text: letter,
      shapeColor: ColorHelper.green,
      shapeSize: circleSize,
      fontSize: fontSize,
    );
  }

  static RoundedLetter withRedCircle(
      String letter, double circleSize, double fontSize) {
    return new RoundedLetter(
      text: letter,
      shapeColor: ColorHelper.red,
      shapeSize: circleSize,
      fontSize: fontSize,
    );
  }

  ShapeConfiguration _buildShapeConfiguration() {
    return ShapeConfiguration(
      shapeType: shapeType,
      shapeColor: shapeColor,
      fontSize: fontSize,
      fontItalic: fontItalic,
      fontBold: fontBold,
      shapeSize: shapeSize,
      fontColor: fontColor,
      text: text,
      borderWidth: borderWidth,
      borderColor: borderColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: () {
          if (clickListener != null) {
            clickListener.onClick(key);
          }
        },
        child: new Container(
            height: shapeSize,
            width: shapeSize,
            child: CustomPaint(
                painter: _Painter(
              shapeConfiguration: _buildShapeConfiguration(),
            ))));
  }
}

class _Painter extends CustomPainter {
  _Painter({
    @required this.shapeConfiguration,
  });

  final ShapeConfiguration shapeConfiguration;

  @override
  void paint(Canvas canvas, Size size) {
    Shape shape;
    switch (shapeConfiguration.shapeType) {
      case ShapeType.circle:
        shape = CircleShape(shapeConfiguration);
        break;
      case ShapeType.triangle:
        shape = TriangleShape(shapeConfiguration);
        break;
      case ShapeType.rectangle:
        shape = RectangleShape(shapeConfiguration);
        break;
      case ShapeType.pentagon:
        shape = PentagonShape(shapeConfiguration);
        break;
      case ShapeType.hexagon:
        shape = HexagonShape(shapeConfiguration);
        break;
    }
    shape.draw(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
