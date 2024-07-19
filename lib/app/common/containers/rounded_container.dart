import 'package:flutter/material.dart';
import '../../utils/constraints/colors.dart';
import '../../utils/constraints/sizes.dart';

class VoidRoundedContainer extends StatelessWidget {
  const VoidRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = VoidSizes.cardRadiusLg,
    this.padding,
    this.child,
    this.backgroundColor = VoidColors.white,
    this.margin,
    this.borderColor = VoidColors.borderPrimary,
    this.showBorder = false,
    this.elevation = 0.0, // Add elevation property
  });

  final double? width;
  final double? height;
  final bool showBorder;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final Color borderColor;
  final Color backgroundColor;
  final double elevation; // Elevation property

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
        color: backgroundColor,
        boxShadow: elevation > 0 // Apply shadow if elevation is greater than 0
            ? [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: elevation,
            offset: Offset(0, elevation / 2), // changes position of shadow
          ),
        ]
            : [],
      ),
      child: ClipRRect(
        //borderRadius: BorderRadius.circular(radius),
        child: child,
      ),
    );
  }
}
