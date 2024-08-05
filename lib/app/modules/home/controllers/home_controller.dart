// import 'package:get/get.dart';
// import '../../../utils/theme/custom_themes/theme.dart';
// import '../../../utils/theme/homeTheme.dart';
//
// class HomeController extends GetxController {
//
//   var currentAppTheme = homeScreen1Theme.obs;
//   var globalTheme = primaryTheme.themeData.obs;
//   var selectedColorTheme = primaryTheme.obs;
//
//   void switchHomeScreen(AppHomeTheme newAppTheme) {
//     currentAppTheme.value = newAppTheme;
//     globalTheme.value = newAppTheme.themeData;
//   }
//
//   void switchGlobalTheme(AppColorTheme newTheme) {
//     selectedColorTheme.value = newTheme;
//     globalTheme.value = newTheme.themeData;
//   }
// }


import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/theme/custom_themes/theme.dart';
import '../../../utils/theme/homeTheme.dart';


class HomeController extends GetxController {
  var currentAppTheme = homeScreen1Theme.obs;
  var selectedColorTheme = primaryTheme.obs;
  var globalTheme = primaryTheme.themeData.obs;

  static const String _selectedColorThemeKey = 'selectedColorTheme';
  static const String _selectedHomeThemeKey = 'selectedHomeTheme';

  @override
  void onInit() {
    super.onInit();
    loadThemes();
  }

  void switchHomeScreen(AppHomeTheme newAppTheme) {
    currentAppTheme.value = newAppTheme;
    updateGlobalTheme();
    saveHomeTheme(newAppTheme);
  }

  void switchGlobalTheme(AppColorTheme newTheme) {
    selectedColorTheme.value = newTheme;
    updateGlobalTheme();
    saveColorTheme(newTheme);
  }

  void updateGlobalTheme() {
    globalTheme.value = selectedColorTheme.value.themeData.copyWith(
      scaffoldBackgroundColor: currentAppTheme.value.themeData.scaffoldBackgroundColor,
      primaryColor: currentAppTheme.value.themeData.primaryColor,
      colorScheme: currentAppTheme.value.themeData.colorScheme.copyWith(
        primary: selectedColorTheme.value.themeData.colorScheme.primary,
        secondary: selectedColorTheme.value.themeData.colorScheme.secondary,
      ),
    );
  }

  Future<void> saveColorTheme(AppColorTheme theme) async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = _getColorThemeIndex(theme);
    prefs.setInt(_selectedColorThemeKey, themeIndex);
  }

  Future<void> saveHomeTheme(AppHomeTheme theme) async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = _getHomeThemeIndex(theme);
    prefs.setInt(_selectedHomeThemeKey, themeIndex);
  }

  Future<void> loadThemes() async {
    final prefs = await SharedPreferences.getInstance();
    final selectedColorThemeIndex = prefs.getInt(_selectedColorThemeKey) ?? 0;
    final selectedHomeThemeIndex = prefs.getInt(_selectedHomeThemeKey) ?? 0;

    selectedColorTheme.value = _getColorThemeFromIndex(selectedColorThemeIndex);
    currentAppTheme.value = _getHomeThemeFromIndex(selectedHomeThemeIndex);
    updateGlobalTheme();
  }

  int _getColorThemeIndex(AppColorTheme theme) {
    if (theme == primaryTheme) return 0;
    if (theme == greyTheme) return 1;
    if (theme == redTheme) return 2;
    if (theme == orangeTheme) return 3;
    if (theme == yellowTheme) return 4;
    if (theme == purpleTheme) return 5;
    if (theme == blueTheme) return 6;
    if (theme == cyanTheme) return 7;
    if (theme == lightGreenTheme) return 8;
    if (theme == parrotTheme) return 9;
    return 0;
  }

  AppColorTheme _getColorThemeFromIndex(int index) {
    switch (index) {
      case 1:
        return greyTheme;
      case 2:
        return redTheme;
      case 3:
        return orangeTheme;
      case 4:
        return yellowTheme;
      case 5:
        return purpleTheme;
      case 6:
        return blueTheme;
      case 7:
        return cyanTheme;
      case 8:
        return lightGreenTheme;
      case 9:
        return parrotTheme;
      default:
        return primaryTheme;
    }
  }

  int _getHomeThemeIndex(AppHomeTheme theme) {
    if (theme == homeScreen1Theme) return 0;
    if (theme == homeScreen2Theme) return 1;
    if (theme == homeScreen3Theme) return 2;
    if (theme == homeScreen4Theme) return 3;
    return 0;
  }

  AppHomeTheme _getHomeThemeFromIndex(int index) {
    switch (index) {
      case 1:
        return homeScreen2Theme;
      case 2:
        return homeScreen3Theme;
      case 3:
        return homeScreen4Theme;
      default:
        return homeScreen1Theme;
    }
  }
}

