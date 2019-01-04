

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoundedLetter extends StatefulWidget {
  RoundedLetter(
      {Key key,
        this.circleColor = const Color.fromARGB(255, 48, 63, 159),
        this.fontColor = const Color.fromARGB(255, 255, 255, 255),
        this.circleSize = 40,
        @required this.letter,
        this.fontSize = 20})
      : assert(!(letter == null), "Please specify valid letter"),
        assert(!(letter.length != 1), "Please specify string with length = 1"),
        assert(!(circleSize < 0), "Please specify circle size greater than 0"),
        assert(!(fontSize > circleSize/2),
        "Font size can't be greater than circle radius"),
        assert(!(fontSize < 0), "Please specify font size greater than 0"),
        super(key: key);

  final Color circleColor;
  final Color fontColor;
  final double circleSize;
  final String letter;
  final double fontSize;

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
      letter: letter,
      circleColor: _getRandomColor(),
      fontColor: _getRandomColor(),
      circleSize: circleSize,
      fontSize: fontSize,
    );
  }

  static RoundedLetter withBlueCircle(
      String letter, double circleSize, double fontSize) {
    return new RoundedLetter(
      letter: letter,
      circleColor: Color.fromARGB(255, 13, 71, 161),
      fontColor: Color.fromARGB(255, 255, 255, 255),
      circleSize: circleSize,
      fontSize: fontSize,
    );
  }

  static RoundedLetter withGreenCircle(
      String letter, double circleSize, double fontSize) {
    return new RoundedLetter(
      letter: letter,
      circleColor: Color.fromARGB(255, 51, 105, 30),
      fontColor: Color.fromARGB(255, 255, 255, 255),
      circleSize: circleSize,
      fontSize: fontSize,
    );
  }

  static RoundedLetter withRedCircle(
      String letter, double circleSize, double fontSize) {
    return new RoundedLetter(
      letter: letter,
      circleColor: Color.fromARGB(255, 183, 28, 28),
      fontColor: Color.fromARGB(255, 255, 255, 255),
      circleSize: circleSize,
      fontSize: fontSize,
    );
  }
}

class _RoundedLetterState extends State<RoundedLetter> {
  @override
  Widget build(BuildContext context) {
    return new Container(
        height: widget.circleSize ,
        width: widget.circleSize,
        child: CustomPaint(
            painter: _Painter(
              circleColor: widget.circleColor,
              fontColor: widget.fontColor,
              circleSize: widget.circleSize,
              fontSize: widget.fontSize,
              letter: widget.letter,
            )));
  }
}

class _Painter extends CustomPainter {
  _Painter(
      {@required this.circleColor,
        @required this.fontColor,
        @required this.circleSize,
        @required this.letter,
        @required this.fontSize});

  final Color circleColor;
  final Color fontColor;
  final double circleSize;
  final String letter;
  final double fontSize;

  @override
  void paint(Canvas canvas, Size size) {
    print("Cricle size: " + circleSize.toString());
    print("Font size: " + fontSize.toString());
    print("Letter: " + letter);
    print("FontColor:" + fontColor.toString());
    print("CircleColor: " + circleColor.toString());
    print("Size: " + size.toString());
    canvas.drawCircle(Offset(circleSize/2, circleSize/2), circleSize/2,
        Paint()..color = circleColor);
    TextSpan span = new TextSpan(
        style: new TextStyle(
            color: fontColor, fontSize: fontSize, fontFamily: 'Roboto'),
        text: letter);
    TextPainter tp =
    new TextPainter(text: span, textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas,
        new Offset(circleSize/2 - fontSize / 3, circleSize/2 - fontSize / 1.75));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
