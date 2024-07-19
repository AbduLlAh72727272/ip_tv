import 'package:get/get.dart';

import '../controllers/parental_controller.dart';

class ParentalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParentalController>(
      () => ParentalController(),
    );
  }
}
