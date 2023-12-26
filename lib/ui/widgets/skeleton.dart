import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  final double? height, width;
  final bool isCircle;
  final double? radius;

  const Skeleton({
    super.key,
    this.height,
    this.width,
    this.isCircle = false,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white.withOpacity(0.8),
      baseColor: Colors.black.withOpacity(0.1),
      child: Container(
        height: height ?? double.infinity,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isCircle
              ? null
              : BorderRadius.all(
                  Radius.circular(radius ?? 0),
                ),
        ),
      ),
    );
  }
}
