import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendor/src/view/common/colors/colors.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';

class ShadowContainer extends StatelessWidget {
  const ShadowContainer(
      {Key? key,
      required this.height,
      required this.width,
      required this.child,
      required this.color,
      this.borderRadius,
      this.margin,
      this.padding})
      : super(key: key);
  final double height;
  final double width;
  final BorderRadiusGeometry? borderRadius;
  final Widget child;
  final Color color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return InnerShadow(
      blur: 5,
      color:WasphaColors.grey200.withOpacity(0.4),
      offset: const Offset(2.5, 2.5),
      child: Container(
        margin: margin,
        padding: padding,
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
        child: child,
      ),
    );
  }
}
//TODO://usually the result of calling methods on a native-backed object when the native resources have already been disposed.
class InnerShadow extends SingleChildRenderObjectWidget {
  const InnerShadow({
    Key ?key,
    this.blur = 10,
    this.color = Colors.black38,
    this.offset = const Offset(10, 10),
    Widget ?child,
  }) : super(key: key, child: child);

  final double blur;
  final Color color;
  final Offset offset;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final _RenderInnerShadow renderObject = _RenderInnerShadow();
    updateRenderObject(context, renderObject);
    return renderObject;
  }

  @override
  void updateRenderObject(
      BuildContext context, _RenderInnerShadow renderObject) {
    renderObject
      ..color = color
      ..blur = blur
      ..dx = offset.dx
      ..dy = offset.dy;
  }
}

class _RenderInnerShadow extends RenderProxyBox {
  double ?blur;
  Color ?color;
  double? dx;
  double? dy;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;

    final Rect rectOuter = offset & size;
    final Rect rectInner = Rect.fromLTWH(
      offset.dx,
      offset.dy,
      size.width - dx!,
      size.height - dy!,
    );
    final Canvas canvas = context.canvas..saveLayer(rectOuter, Paint());
    context.paintChild(child!, offset);
    final Paint shadowPaint = Paint()
      ..blendMode = BlendMode.srcATop
      ..imageFilter = ImageFilter.blur(sigmaX: blur!, sigmaY: blur!)
      ..colorFilter = ColorFilter.mode(color!, BlendMode.srcOut);

    canvas
      ..saveLayer(rectOuter, shadowPaint)
      ..saveLayer(rectInner, Paint())
      ..translate(dx!, dy!);
    context.paintChild(child!, offset);
    context.canvas..restore()..restore()..restore();
  }
}