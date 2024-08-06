import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'app/modules/Movies/controllers/movies_controller.dart';
import 'app/modules/home/controllers/home_controller.dart';
import 'app/modules/live_TV/controllers/live_t_v_controller.dart';
import 'app/modules/selectLanguage/controllers/select_language_controller.dart';
import 'app/modules/splash/views/splash_view.dart';
import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';
import 'app/modules/Movies/models/movie_model.dart';

String language = "";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  Get.put(MoviesController());
  Get.put(LiveTVController());

  // Register the adapter
  Hive.registerAdapter(MovieAdapter());

  await Hive.openBox<Movie>('moviesBox');

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) async {
    final languageController = Get.put(SelectLanguageController());
    language = await languageController.loadSavedLanguage();
    log("My Saved Language: $language");
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // For status bar color and icons color
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => Obx(
            () => GetMaterialApp(
          title: 'ARK VIP',
          debugShowCheckedModeBanner: false,
          theme: homeController.globalTheme.value,
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
