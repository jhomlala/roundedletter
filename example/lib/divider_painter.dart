import 'package:flutter/widgets.dart';

class DividerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

  Paint paint = Paint();
  paint..color = Color(0xFF424242);
  paint..strokeWidth = 1;
    return canvas.drawLine(Offset(40, 0), Offset( size.width-40 , 0),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
