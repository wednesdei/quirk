import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:quirk/quirk/traits/particles.dart';

/// Create a Quirk custom painter to make really cool stuff

class Quirk extends StatefulWidget {
  const Quirk({Key? key}) : super(key: key);

  @override
  State<Quirk> createState() => _QuirkState();
}

class _QuirkState extends State<Quirk> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: QuirkPainter(),
      child: Container(
        alignment: Alignment.center,
        width: 500.0,
        height: 500.0,
      ),
    );
  }
}

class QuirkPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //quirkGrid(canvas, size);
    extraCircles(canvas, size);
    extraSmallerCircles(canvas, size);
  }

  extraCircles(canvas, size) {
    var random = Random();
    for (var i = 0; i < 100; i++) {
      var radius = random.nextDouble() * 50;
      var center = Offset(
          random.nextDouble() * size.width, random.nextDouble() * size.height);
      var paint = Paint()
        ..color = Color.fromARGB(255, 221, 13, 228)
        ..isAntiAlias = true
        ..maskFilter =
            MaskFilter.blur(BlurStyle.normal, 1 + random.nextDouble() * 5)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(center, radius, paint);
    }
  }

  extraSmallerCircles(canvas, size) {
    Random randomS = Random();
    for (var i = 0; i < 100; i++) {
      var radius = randomS.nextDouble() * 25;
      var center = Offset(randomS.nextDouble() * size.width,
          randomS.nextDouble() * size.height);
      var paint = Paint()
        ..color = Color.fromARGB(255, 17, 7, 130)
        ..isAntiAlias = true
        ..maskFilter =
            MaskFilter.blur(BlurStyle.normal, 1 + randomS.nextDouble() * 5)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  @override
  bool? hitTest(Offset position) {
    // TODO: implement hitTest
  }
}
