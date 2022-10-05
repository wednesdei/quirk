import 'package:flutter/material.dart';
import 'dart:math' as math;

class StarPainter extends StatefulWidget {
  const StarPainter({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _StarPainterState createState() => _StarPainterState();
}

class _StarPainterState extends State<StarPainter>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController _controller;
  late final Tween<double> _rotationTween =
      Tween(begin: -math.pi, end: math.pi);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    animation = _rotationTween.animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    _controller.forward();
  }

  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PaintStars(),
      child: const SizedBox.expand(),
    );
  }
}

class PaintStars extends CustomPainter {
  final Paint _paint;

  PaintStars() : _paint = Paint() {
    _paint.color = Colors.black;
    _paint.style = PaintingStyle.fill;
    _paint.strokeCap = StrokeCap.round;
    _paint.strokeWidth = 2;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    var backgroundGradient = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[
        Color(0xff1f005c),
        Color(0xff5b0060),
        Color(0xff870160),
        Color(0xffac255e),
        Color(0xffca485c),
        Color(0xffe16b5c),
        Color(0xfff39060),
        Color(0xffffb56b),
      ],
      tileMode: TileMode.mirror,
    );

    /// Create a nice gradient background to work on
    canvas.drawPaint(
      Paint()
        ..shader = backgroundGradient.createShader(
          Rect.fromLTWH(0.0, 0.0, size.width, size.height),
        ),
    );

    var pointShader = const RadialGradient(
      center: Alignment.center,
      radius: 1.0,
      colors: <Color>[
        Color.fromARGB(255, 255, 0, 200),
        Color.fromARGB(0, 76, 0, 255),
      ],
      tileMode: TileMode.clamp,
    );

    var starPaint = Paint()
      ..shader = pointShader.createShader(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: 15.0,
        ),
      );

    var center = Offset(size.width / 2, size.height / 2);
    var radius = 15.0;
    canvas.drawCircle(center, radius, starPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
