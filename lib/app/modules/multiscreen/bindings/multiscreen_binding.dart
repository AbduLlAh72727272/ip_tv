import 'package:get/get.dart';

import '../controllers/multiscreen_controller.dart';

class MultiscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MultiscreenController>(
      () => MultiscreenController(),
    );
  }
}
