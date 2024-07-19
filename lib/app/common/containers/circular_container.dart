import 'package:flutter/material.dart';
import '../../utils/constraints/colors.dart';

class VoidCircularContainer extends StatelessWidget {
  const VoidCircularContainer({
    super.key,
    this.width = 80,
    this.height = 80,
    this.radius = 100,
    this.padding = 0,
    this.child,
    this.backgroundColor = VoidColors.white,
    this.margin,
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: backgroundColor),
      child: ClipRRect(borderRadius: BorderRadius.circular(radius), child: child),
    );
  }
}
