import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fast_noise/fast_noise.dart';

quirkGrid(canvas, size) {
  // var backgroundGradient = const LinearGradient(
  //   begin: Alignment.centerLeft,
  //   end: Alignment.centerRight,
  //   colors: <Color>[
  //     Color(0xff1f005c),
  //     Color(0xff5b0060),
  //     Color(0xff870160),
  //     Color(0xffac255e),
  //     Color(0xffca485c),
  //     Color(0xffe16b5c),
  //     Color(0xfff39060),
  //     Color(0xffffb56b),
  //   ],
  //   tileMode: TileMode.mirror,

  var backgroundGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[
      Color(0xFF212529),
      Color(0xFF212529),
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

  var gridPoints = const RadialGradient(
    center: Alignment.center,
    radius: 1.0,
    colors: <Color>[
      Color(0x80FCA311),
      Color(0x40FCA311),
    ],
    tileMode: TileMode.clamp,
  );

  /// World options
  var width = size.width;
  var height = size.height;
  var scale = 40.0;
  var numberOfColumns = width / scale;
  var numberOfRows = height / scale;
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
      } // end for x
    } // end for y
  } // end createGrid

  createGrid(canvas, size);
} // end quirkGrid





  // createTriangles(canvas, size) {
  //   canvas.save();
  //   canvas.translate(width / 2, height / 2);
  //   canvas.scale(0.5, 0.5);
  //   canvas.translate(-width / 2, -height / 2);

  //   final linePaint = Paint()
  //     ..color = Colors.black
  //     ..strokeWidth = 1.0;
  //   for (int y = 0; y < numberOfRows; y++) {
  //     for (int x = 0; x < numberOfColumns; x++) {
  //       var linePoint1 = Offset(x * scale, y * scale);
  //       var linePoint2 = Offset((x + 1) * scale, y * scale);
  //       canvas.drawLine(linePoint1, linePoint2, linePaint);

  //       var linePoint3 = Offset(x * scale, (y + 1) * scale);
  //       var linePoint4 = Offset((x + 1) * scale, (y) * scale);
  //       canvas.drawLine(linePoint3, linePoint4, linePaint);

  //       var linePoint5 = Offset((x) * scale, (y) * scale);
  //       var linePoint6 = Offset(x * scale, (y + 1) * scale);
  //       canvas.drawLine(linePoint5, linePoint6, linePaint);

  //       var radius = 1.0;
  //       var center = Offset(x * scale, y * scale);
  //       var paint = Paint()
  //         ..shader = gridPoints
  //             .createShader(Rect.fromLTWH(0, 0, radius * 2, radius * 2));
  //       canvas.drawCircle(center, radius, paint);
  //     } // end for x
  //   } // end for y
  //   canvas.save();
  //   canvas.restore();
  //   return canvas;
  // }

//   createGrid(canvas, size);
//   createTriangles(canvas, size);
// }
