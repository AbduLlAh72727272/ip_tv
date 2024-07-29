import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/modules/home/controllers/home_controller.dart';
import 'app/modules/splash/views/splash_view.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => Obx(() =>
        GetMaterialApp(
          title: 'ARK VIP',
          debugShowCheckedModeBanner: false,
            theme: homeController.globalTheme.value,

          home: SplashView(),
          getPages: AppPages.routes,
        ),
      ),
    );
  }
}
