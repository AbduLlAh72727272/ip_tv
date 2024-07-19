import 'package:flutter/material.dart';

import '../../utils/constraints/colors.dart';
import '../../utils/constraints/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class VoidCircularIcon extends StatelessWidget {
  const VoidCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = VoidSizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width,height,size;
  final IconData icon;
  final Color? color, backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null?
          backgroundColor!:
          VoidHelperFunctions.isDarkMode(context)?
            VoidColors.black.withOpacity(0.9):
            VoidColors.white.withOpacity(0.9)
        ,
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon,color: color, size: size,),),
    );
  }
}
