import 'dart:developer';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectLanguageController extends GetxController {
  RxString currentLanguage = "en".obs;

  @override
  void onInit() {
    super.onInit();
    loadSavedLanguage();
  }

  Future<void> changeLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', languageCode);
    currentLanguage.value = languageCode;
    Get.updateLocale(Locale(languageCode));
    log("Change Language ${currentLanguage.value}");
  }

  Future<String> loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString('language') ?? "en";
    currentLanguage.value = savedLanguage;
    Get.updateLocale(Locale(savedLanguage));
    log("Load Language ${currentLanguage.value}");
    return savedLanguage;
  }
}
