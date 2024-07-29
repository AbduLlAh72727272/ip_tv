import 'package:flutter/material.dart';
import '../../constraints/colors.dart';
import 'button_theme_for_color.dart';
import 'elevated_button_theme.dart';


class AppColorTheme {
  final ThemeData themeData;

  AppColorTheme({required this.themeData});
}

final AppColorTheme primaryTheme = AppColorTheme(
  themeData: ThemeData(
    primaryColor: VoidColors.primary,
    colorScheme: ColorScheme.light(
      primary: VoidColors.secondary,
      secondary: VoidColors.secPrimary,
    ),
    iconTheme: IconThemeData(color: VoidColors.primary),
    elevatedButtonTheme: ElevatedButtonThemeForColors.primaryButtonTheme,

  ),
);

final AppColorTheme greyTheme = AppColorTheme(
  themeData: ThemeData(
    primaryColor: VoidColors.greyColor,
    colorScheme: ColorScheme.light(
      primary: VoidColors.greyColor,
      secondary: VoidColors.greyColor,
    ),
    iconTheme: IconThemeData(color: VoidColors.greyColor),
    elevatedButtonTheme: ElevatedButtonThemeForColors.greyButtonTheme,
  ),
);

final AppColorTheme redTheme = AppColorTheme(
  themeData: ThemeData(
    primaryColor: VoidColors.redColor,
    colorScheme: ColorScheme.light(
      primary: VoidColors.redColor,
      secondary: VoidColors.redColor,
    ),
    iconTheme: IconThemeData(color: VoidColors.redColor),
    elevatedButtonTheme: ElevatedButtonThemeForColors.redButtonTheme,
  ),
);

final AppColorTheme orangeTheme = AppColorTheme(
  themeData: ThemeData(
    primaryColor: VoidColors.orangeColor,
    colorScheme: ColorScheme.light(
      primary: VoidColors.orangeColor,
      secondary: VoidColors.orangeColor,
    ),
    iconTheme: IconThemeData(color: VoidColors.orangeColor),
    elevatedButtonTheme: ElevatedButtonThemeForColors.orangeButtonTheme,
  ),
);

final AppColorTheme yellowTheme = AppColorTheme(
  themeData: ThemeData(
    primaryColor: VoidColors.yellowColor,
    colorScheme: ColorScheme.light(
      primary: VoidColors.yellowColor,
      secondary: VoidColors.yellowColor,
    ),
    iconTheme: IconThemeData(color: VoidColors.yellowColor),
    elevatedButtonTheme: ElevatedButtonThemeForColors.yellowButtonTheme,
  ),
);

final AppColorTheme purpleTheme = AppColorTheme(
  themeData: ThemeData(
    primaryColor: VoidColors.purpleColor,
    colorScheme: ColorScheme.light(
      primary: VoidColors.purpleColor,
      secondary: VoidColors.purpleColor,
    ),
    iconTheme: IconThemeData(color: VoidColors.purpleColor),
    elevatedButtonTheme: ElevatedButtonThemeForColors.purpleButtonTheme,
  ),
);

final AppColorTheme blueTheme = AppColorTheme(
  themeData: ThemeData(
    primaryColor: VoidColors.blueColor,
    colorScheme: ColorScheme.light(
      primary: VoidColors.blueColor,
      secondary: VoidColors.blueColor,
    ),
    iconTheme: IconThemeData(color: VoidColors.blueColor),
    elevatedButtonTheme: ElevatedButtonThemeForColors.blueButtonTheme,
  ),
);

final AppColorTheme cyanTheme = AppColorTheme(
  themeData: ThemeData(
    primaryColor: VoidColors.cyanColor,
    colorScheme: ColorScheme.light(
      primary: VoidColors.cyanColor,
      secondary: VoidColors.cyanColor,
    ),
    iconTheme: IconThemeData(color: VoidColors.cyanColor),
    elevatedButtonTheme: ElevatedButtonThemeForColors.cyanButtonTheme,
  ),
);

final AppColorTheme lightGreenTheme = AppColorTheme(
  themeData: ThemeData(
    primaryColor: VoidColors.lightGreen,
    colorScheme: ColorScheme.light(
      primary: VoidColors.lightGreen,
      secondary: VoidColors.lightGreen,
    ),
    iconTheme: IconThemeData(color: VoidColors.lightGreen),
    elevatedButtonTheme: ElevatedButtonThemeForColors.lightGreenButtonTheme,
  ),
);

final AppColorTheme parrotTheme = AppColorTheme(
  themeData: ThemeData(
    primaryColor: VoidColors.parrotColor,
    colorScheme: ColorScheme.light(
      primary: VoidColors.parrotColor,
      secondary: VoidColors.parrotColor,
    ),
    iconTheme: IconThemeData(color: VoidColors.parrotColor),
    elevatedButtonTheme: ElevatedButtonThemeForColors.parrotButtonTheme,
  ),
);

