import 'package:flutter/material.dart';

/// 线条组件
class LineWidget extends StatelessWidget {
  final Offset start;
  final Offset end;
  final Color color;
  final double strokeWidth;

  const LineWidget({
    super.key,
    required this.start,
    required this.end,
    this.color = Colors.black,
    this.strokeWidth = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size((end.dx - start.dx).abs(), (end.dy - start.dy).abs()),
      painter: _LinePainter(start, end, color, strokeWidth),
    );
  }
}

class _LinePainter extends CustomPainter {
  final Offset start;
  final Offset end;
  final Color color;
  final double strokeWidth;

  _LinePainter(this.start, this.end, this.color, this.strokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(covariant _LinePainter oldDelegate) {
    return oldDelegate.start != start ||
        oldDelegate.end != end ||
        oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}