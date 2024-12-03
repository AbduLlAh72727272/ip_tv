import 'package:get/get.dart';

import '../controllers/time_format_controller.dart';

class TimeFormatBinding extends Bindings {
  @override
  void dependencies() {
    final TimeFormatController timeFormatController =Get.isRegistered()?Get.find(): Get.put(TimeFormatController() , permanent: true);

  }
}
