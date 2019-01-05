import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rounded_letter/shape_type.dart';

class RoundedLetter extends StatefulWidget {
  RoundedLetter({
    Key key,
    this.shapeType = ShapeType.circle,
    this.shapeColor = const Color.fromARGB(255, 48, 63, 159),
    this.fontColor = const Color.fromARGB(255, 255, 255, 255),
    this.shapeSize = 40,
    @required this.text,
    this.fontSize = 20,
    this.borderWidth = 0,
    this.borderColor = const Color.fromARGB(0, 0, 0, 0),
  })  : assert(!(text == null), "Invalid letter"),
        assert(
            !(text.length <= 1 && text.length >= 2), "String length must be 1 or 2"),
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
  final double shapeSize;
  final String text;
  final double fontSize;
  final double borderWidth;
  final Color borderColor;

  @override
  State<StatefulWidget> createState() => _RoundedLetterState();

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
      shapeColor: Color.fromARGB(255, 13, 71, 161),
      fontColor: Color.fromARGB(255, 255, 255, 255),
      shapeSize: circleSize,
      fontSize: fontSize,
    );
  }

  static RoundedLetter withGreenCircle(
      String letter, double circleSize, double fontSize) {
    return new RoundedLetter(
      text: letter,
      shapeColor: Color.fromARGB(255, 51, 105, 30),
      fontColor: Color.fromARGB(255, 255, 255, 255),
      shapeSize: circleSize,
      fontSize: fontSize,
    );
  }

  static RoundedLetter withRedCircle(
      String letter, double circleSize, double fontSize) {
    return new RoundedLetter(
      text: letter,
      shapeColor: Color.fromARGB(255, 183, 28, 28),
      fontColor: Color.fromARGB(255, 255, 255, 255),
      shapeSize: circleSize,
      fontSize: fontSize,
    );
  }
}

class _RoundedLetterState extends State<RoundedLetter> {
  @override
  Widget build(BuildContext context) {
    return new Container(
        height: widget.shapeSize,
        width: widget.shapeSize,
        child: CustomPaint(
            painter: _Painter(
          shapeType: widget.shapeType,
          shapeColor: widget.shapeColor,
          fontColor: widget.fontColor,
          shapeSize: widget.shapeSize,
          fontSize: widget.fontSize,
          text: widget.text,
          borderWidth: widget.borderWidth,
          borderColor: widget.borderColor,
        )));
  }
}

class _Painter extends CustomPainter {
  _Painter({
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

  @override
  void paint(Canvas canvas, Size size) {
    if (shapeType == ShapeType.circle) {
      _paintCircle(canvas);
    } else if (shapeType == ShapeType.rectangle) {
      _paintRectangle(canvas);
    }

    TextSpan span = new TextSpan(
        style: new TextStyle(
            color: fontColor, fontSize: fontSize, letterSpacing: 0),
        text: text);
    TextPainter tp =
        new TextPainter(text: span, textDirection: TextDirection.ltr);

    tp.layout();
    tp.paint(canvas,
        new Offset(_getTextOffsetX(tp.width), _getTextOffsetY(tp.height)));
  }

  _paintCircle(Canvas canvas) {
    double radius = _getShapeHalfSize();
    double radiusWithBorder = _getShapeHalfSizeWithBorder();
    if (borderWidth > 0) {
      canvas.drawCircle(Offset(radiusWithBorder, radiusWithBorder),
          radiusWithBorder, Paint()..color = borderColor);
    }
    canvas.drawCircle(Offset(radiusWithBorder, radiusWithBorder), radius,
        Paint()..color = shapeColor);
  }

  _paintRectangle(Canvas canvas) {
    double shapeWidthWithBorder = _getShapeEdgeWithBorder();
    if (borderWidth > 0) {
      canvas.drawRect(
          Rect.fromLTRB(0, 0, shapeWidthWithBorder, shapeWidthWithBorder),
          Paint()..color = borderColor);
    }
    canvas.drawRect(
        Rect.fromLTRB(borderWidth, borderWidth, shapeSize, shapeSize), Paint()..color = shapeColor);
  }

  double _getShapeEdgeWithBorder() {
    return shapeSize + borderWidth;
  }

  double _getTextOffsetX(double width) {
    return _getShapeHalfSize() + borderWidth - width / 2;
  }

  double _getTextOffsetY(double height) {
    return _getShapeHalfSize() + borderWidth - height / 2;
  }

  double _getShapeHalfSize() {
    return shapeSize / 2;
  }

  double _getShapeHalfSizeWithBorder() {
    return _getShapeHalfSize() + borderWidth;
  }


  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
