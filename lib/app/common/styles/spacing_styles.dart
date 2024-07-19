import 'package:flutter/material.dart';
import '../../utils/constraints/sizes.dart';

class VoidSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppbarHeight = EdgeInsets.only(
    top: VoidSizes.appBarHeight,
    bottom: VoidSizes.defaultSpace,
    left: VoidSizes.defaultSpace,
    right: VoidSizes.defaultSpace,
  );
}