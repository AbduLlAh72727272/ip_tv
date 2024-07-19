import 'package:get/get.dart';

import '../controllers/time_format_controller.dart';

class TimeFormatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TimeFormatController>(
      () => TimeFormatController(),
    );
  }
}
