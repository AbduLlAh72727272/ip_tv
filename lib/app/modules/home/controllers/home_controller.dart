import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme/custom_themes/theme.dart';
import '../../../utils/theme/homeTheme.dart';

class HomeController extends GetxController {

  var currentAppTheme = homeScreen1Theme.obs;
  // var globalTheme = ThemeData.light().obs;
  // var globalTheme = homeScreen1Theme.themeData.obs;
  var globalTheme = primaryTheme.themeData.obs;
  var selectedColorTheme = primaryTheme.obs;

  void switchHomeScreen(AppHomeTheme newAppTheme) {
    currentAppTheme.value = newAppTheme;
    globalTheme.value = newAppTheme.themeData;
  }

  void switchGlobalTheme(AppColorTheme newTheme) {
    // globalTheme.value = newTheme;
    selectedColorTheme.value = newTheme;
    globalTheme.value = newTheme.themeData;
  }
}
