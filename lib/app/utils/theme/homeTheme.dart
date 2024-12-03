import 'package:flutter/material.dart';
import 'package:ip_tv/app/modules/home/views/fourth_home_view.dart';
import 'package:ip_tv/app/modules/home/views/home_screen_wrapper.dart';
import 'package:ip_tv/app/modules/home/views/home_theme_dialog.dart';
import 'package:ip_tv/app/modules/home/views/third_home_view.dart';
import '../../modules/home/views/first_home_view.dart';
import '../../modules/home/views/home_view.dart';
import '../constraints/colors.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/text_theme.dart';

// class VoidAppTheme {
//   VoidAppTheme._();
//
//   static ThemeData lightTheme = ThemeData (
//     useMaterial3: true,
//     fontFamily: 'Arial',
//     brightness: Brightness.light,
//     primaryColor: VoidColors.blue,
//     scaffoldBackgroundColor: Colors.white,
//     textTheme: VoidTextTheme.lightTextTheme,
//     chipTheme: VoidChipTheme.lightChipTheme,
//     appBarTheme: VoidAppBarTheme.lightAppBarTheme,
//     checkboxTheme: VoidCheckboxTheme.lightCheckBoxTheme,
//     bottomSheetTheme: VoidBottomSheetTheme.lightBottomSheetTheme,
//     elevatedButtonTheme: VoidElevatedButtonTheme.lightElevatedButtonTheme,
//     outlinedButtonTheme: VoidOutlinedButtonTheme.lightOutlinedButtonTheme,
//     inputDecorationTheme: VoidTextFieldTheme.lightInputDecorationTheme,
//   );
//   static ThemeData darkTheme = ThemeData (
//     useMaterial3: true,
//     fontFamily: 'Arial',
//     brightness: Brightness.dark,
//     primaryColor: VoidColors.blue,
//     scaffoldBackgroundColor: Colors.black,
//     textTheme: VoidTextTheme.darkTextTheme,
//     chipTheme: VoidChipTheme.darkChipTheme,
//     appBarTheme: VoidAppBarTheme.darkAppBarTheme,
//     checkboxTheme: VoidCheckboxTheme.darkCheckBoxTheme,
//     bottomSheetTheme: VoidBottomSheetTheme.darkBottomSheetTheme,
//     elevatedButtonTheme: VoidElevatedButtonTheme.darkElevatedButtonTheme,
//     outlinedButtonTheme: VoidOutlinedButtonTheme.darkOutlinedButtonTheme,
//     inputDecorationTheme: VoidTextFieldTheme.darkInputDecorationTheme,
//   );
// }


class AppHomeTheme {
  final ThemeData themeData;
  final Widget homeScreenWidget;

  AppHomeTheme({required this.themeData, required this.homeScreenWidget});
}

final AppHomeTheme homeScreen1Theme = AppHomeTheme(
  themeData: ThemeData(
    primaryColor: VoidColors.primary,
    colorScheme: ColorScheme.light(
      primary: VoidColors.secondary,
      secondary: VoidColors.secPrimary,
    ),
    iconTheme: IconThemeData(color: VoidColors.primary),
    elevatedButtonTheme: VoidElevatedButtonTheme.firstHomeElevatedButtonTheme,

  ),
  homeScreenWidget: FirstHomeView(),
);

final AppHomeTheme homeScreen2Theme = AppHomeTheme(
  themeData: ThemeData(
    primaryColor: VoidColors.primary,
    colorScheme: ColorScheme.light(
      primary: VoidColors.secondary,
      secondary: VoidColors.secPrimary,
    ),
    iconTheme: IconThemeData(color: VoidColors.primary),
    elevatedButtonTheme: VoidElevatedButtonTheme.firstHomeElevatedButtonTheme,

  ),
  homeScreenWidget: HomeView(),
);

final AppHomeTheme homeScreen3Theme = AppHomeTheme(
  themeData: ThemeData(
    primaryColor: VoidColors.primary,
    colorScheme: ColorScheme.light(
      primary: VoidColors.secondary,
      secondary: VoidColors.secPrimary,
    ),
    iconTheme: IconThemeData(color: VoidColors.primary),
    elevatedButtonTheme: VoidElevatedButtonTheme.firstHomeElevatedButtonTheme,

  ),
  homeScreenWidget: ThirdHomeView(),
);

final AppHomeTheme homeScreen4Theme = AppHomeTheme(
  themeData: ThemeData(
    primaryColor: VoidColors.primary,
    colorScheme: ColorScheme.light(
      primary: VoidColors.secondary,
      secondary: VoidColors.secPrimary,
    ),
    iconTheme: IconThemeData(color: VoidColors.primary),
    elevatedButtonTheme: VoidElevatedButtonTheme.firstHomeElevatedButtonTheme,

  ),
  homeScreenWidget: FourthHomeView(),
);

