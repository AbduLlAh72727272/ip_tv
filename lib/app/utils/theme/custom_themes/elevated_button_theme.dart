import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constraints/colors.dart';

class VoidElevatedButtonTheme {
  VoidElevatedButtonTheme._();
  static final firstHomeElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: VoidColors.whiteColor,
      backgroundColor: VoidColors.primary,
      textStyle: TextStyle(color: VoidColors.whiteColor),
    ),
  );
  static final secHomeElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: VoidColors.whiteColor,
      backgroundColor: VoidColors.greenColor,
      textStyle: TextStyle(color: VoidColors.whiteColor),
    ),
  );
}