import 'dart:ui';
import 'dart:math';
import 'package:vector_math/vector_math.dart';
import 'package:flutter/painting.dart';

quirkGrid(canvas, size) {
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
  var gridPoints = const RadialGradient(
    center: Alignment.center,
    radius: 1.0,
    colors: <Color>[
      Color(0x00000000),
      Color(0xff222222),
    ],
    tileMode: TileMode.clamp,
  );

  /// Create a nice gradient background to work on
  canvas.drawPaint(
    Paint()
      ..shader = backgroundGradient.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      ),
  );

  /// World options
  var width = size.width;
  var height = size.height;
  var scale = 20.0;
  var numberOfColumns = width / scale;
  var numberOfRows = height / scale;
  List<Offset> verticies = [];
  List<Vector3> triangles = [];

  void createGrid(canvas, size) {
    /// Create a grid of points
    for (int y = 0; y < numberOfRows; y++) {
      for (int x = 0; x < numberOfColumns; x++) {
        var radius = 1.0;
        var center = Offset(x * scale, y * scale);
        var paint = Paint()
          ..shader = gridPoints
              .createShader(Rect.fromLTWH(0, 0, radius * 2, radius * 2));
        canvas.drawCircle(center, radius, paint);
      }
    }
  }

  void createTriangles(canvas, size) {
    for (int y = 0; y < numberOfRows; y++) {
      for (int x = 0; x < numberOfColumns; x++) {
        verticies.add(Offset(x * scale, y * scale));
        canvas.drawLine(x * scale, y * scale);
        verticies.add(Offset(x * scale, (y + 1) * scale));
        triangles.add(Vector3(x * scale, y * scale, (y + 1) * scale));
        var radius = 1.0;
        var center = Offset(x * scale, y * scale);
        var paint = Paint()
          ..shader = gridPoints
              .createShader(Rect.fromLTWH(0, 0, radius * 2, radius * 2));
        canvas.drawCircle(center, radius, paint);
      }
    }
  }

  //createGrid(canvas, size);
  createTriangles(canvas, size);
}
