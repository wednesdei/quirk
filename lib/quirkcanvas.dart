import 'dart:typed_data';
import 'dart:ui' as ui;

/// Create an [abstract_class] to represent a [Canvas] that can be used to draw
/// on a [ui.PictureRecorder].

abstract class QuirkCanvas {
  void drawCircle(ui.Offset c, double radius, ui.Paint paint);
  void drawLine(ui.Offset p1, ui.Offset p2, ui.Paint paint);
  void drawOval(ui.Rect rect, ui.Paint paint);
  void drawPaint(ui.Paint paint);
  void drawPath(ui.Path path, ui.Paint paint);
  void drawPicture(ui.Picture picture);
  void drawPoints(
      ui.PointMode pointMode, List<ui.Offset> points, ui.Paint paint);
  void drawRect(ui.Rect rect, ui.Paint paint);
  void drawRRect(ui.RRect rrect, ui.Paint paint);
  void drawShadow(
      ui.Path path, ui.Color color, double elevation, bool transparentOccluder);
  void drawVertices(
      ui.Vertices vertices, ui.BlendMode blendMode, ui.Paint paint);
  void restore();
  void rotate(double radians);
  void save();
  void saveLayer(ui.Rect bounds, ui.Paint paint);
  void scale(double sx, [double? sy]);
  void skew(double sx, double sy);
  void transform(Float64List matrix4);
  void translate(double dx, double dy);
}

/// Create a [QuirkCanvas] that wraps a [Canvas] and delegates all calls to it.
///
/// This is useful for testing, where you can create a [QuirkCanvas] that
/// delegates to a [Canvas] that records the calls to it, and then you can
/// verify that the calls were made as expected.

QuirkCanvas wrapCanvas(QuirkCanvas canvas) => _WrappedCanvas(canvas);

class _WrappedCanvas implements QuirkCanvas {
  _WrappedCanvas(this.canvas);

  final QuirkCanvas canvas;

  @override
  void drawCircle(ui.Offset c, double radius, ui.Paint paint) {
    canvas.drawCircle(c, radius, paint);
  }

  @override
  void drawLine(ui.Offset p1, ui.Offset p2, ui.Paint paint) {
    canvas.drawLine(p1, p2, paint);
  }

  @override
  void drawOval(ui.Rect rect, ui.Paint paint) {
    canvas.drawOval(rect, paint);
  }

  @override
  void drawPaint(ui.Paint paint) {
    canvas.drawPaint(paint);
  }

  @override
  void drawPath(ui.Path path, ui.Paint paint) {
    canvas.drawPath(path, paint);
  }

  @override
  void drawPicture(ui.Picture picture) {
    canvas.drawPicture(picture);
  }

  @override
  void drawPoints(
      ui.PointMode pointMode, List<ui.Offset> points, ui.Paint paint) {
    canvas.drawPoints(pointMode, points, paint);
  }

  @override
  void drawRect(ui.Rect rect, ui.Paint paint) {
    canvas.drawRect(rect, paint);
  }

  @override
  void drawRRect(ui.RRect rrect, ui.Paint paint) {
    canvas.drawRRect(rrect, paint);
  }

  @override
  void drawShadow(ui.Path path, ui.Color color, double elevation,
      bool transparentOccluder) {
    canvas.drawShadow(path, color, elevation, transparentOccluder);
  }

  @override
  void drawVertices(
      ui.Vertices vertices, ui.BlendMode blendMode, ui.Paint paint) {
    canvas.drawVertices(vertices, blendMode, paint);
  }

  @override
  void restore() {
    canvas.restore();
  }

  @override
  void rotate(double radians) {
    canvas.rotate(radians);
  }

  @override
  void save() {
    canvas.save();
  }

  @override
  void saveLayer(ui.Rect bounds, ui.Paint paint) {
    canvas.saveLayer(bounds, paint);
  }

  @override
  void scale(double sx, [double? sy]) {
    canvas.scale(sx, sy);
  }

  @override
  void skew(double sx, double sy) {
    canvas.skew(sx, sy);
  }

  @override
  void transform(matrix4) {
    // TODO: implement transform
  }

  @override
  void translate(double dx, double dy) {
    // TODO: implement translate
  }
}
