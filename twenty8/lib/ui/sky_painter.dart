import 'package:flutter/material.dart';
import '../models/celestial_object.dart';

class SkyMapPainter extends CustomPainter {
  final List<CelestialObject> objects;

  SkyMapPainter(this.objects);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;
    for (var object in objects) {
      // Draw celestial objects on the canvas
      // Example: canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
