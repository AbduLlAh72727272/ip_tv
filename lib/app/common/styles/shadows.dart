import 'package:flutter/cupertino.dart';
import '../../utils/constraints/colors.dart';

class VoidShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: VoidColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );

  static final horizontalProductShadow = BoxShadow(
    color: VoidColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );

}