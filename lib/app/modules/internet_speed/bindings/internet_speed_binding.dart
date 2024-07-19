import 'package:get/get.dart';

import '../controllers/internet_speed_controller.dart';

class InternetSpeedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InternetSpeedController>(
      () => InternetSpeedController(),
    );
  }
}
