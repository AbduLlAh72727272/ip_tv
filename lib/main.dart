import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/modules/home/controllers/home_controller.dart';
import 'app/modules/selectLanguage/controllers/select_language_controller.dart';
import 'app/modules/splash/views/splash_view.dart';
import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

String language = "";
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) async {
    final languageController = Get.put(SelectLanguageController());
    language = await languageController
        .loadSavedLanguage(); // Load saved language preference
    log("My Saved Language:${language}");
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690), // Update this based on your design
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => Obx(() =>
        GetMaterialApp(
          title: 'ARK VIP',
          debugShowCheckedModeBanner: false,
            theme: homeController.globalTheme.value,
          // theme: ThemeData(
          //   primarySwatch: Colors.blue,
          // ),
          home: SplashView(),
          locale: Locale(
            language != "es" ? "en" : "es",
            language != "es" ? "US" : "ES",
          ),
          fallbackLocale: Locale("en", "US"),
          translationsKeys: AppTranslation.translations,
          getPages: AppPages.routes,
        ),
      ),
    );
  }
}
