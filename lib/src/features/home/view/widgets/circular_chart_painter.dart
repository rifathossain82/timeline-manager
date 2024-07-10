import 'package:flutter/material.dart';
import 'dart:math';

class CircularChartPainter extends CustomPainter {
  final double percentage;
  final List<Color> gradientColors;
  final Color backgroundColor;
  final double strokeWidth;

  CircularChartPainter({
    required this.percentage,
    required this.gradientColors,
    required this.backgroundColor,
    this.strokeWidth = 12.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) - paint.strokeWidth / 2;

    const startAngle = pi / 2;
    final sweepAngle = 2 * pi * (percentage / 100);

    /// To draw the background arc
    paint.color = backgroundColor;
    paint.shader = null;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), 0, 2 * pi, false, paint);

    /// To draw the gradient arc
    final rect = Rect.fromCircle(center: center, radius: radius);
    paint.shader = SweepGradient(
      startAngle: startAngle,
      endAngle: startAngle + sweepAngle,
      colors: gradientColors,
      stops: const [0.0, 1.0],
      transform: const GradientRotation(startAngle),
    ).createShader(rect);

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);

    final innerCirclePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final innerCircleRadius = radius * 0.7;
    canvas.drawCircle(center, innerCircleRadius, innerCirclePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}