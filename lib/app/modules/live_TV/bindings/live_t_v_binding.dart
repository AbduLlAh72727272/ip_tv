import 'package:get/get.dart';

import '../controllers/live_t_v_controller.dart';

class LiveTVBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LiveTVController>(
      () => LiveTVController(),
    );
  }
}
