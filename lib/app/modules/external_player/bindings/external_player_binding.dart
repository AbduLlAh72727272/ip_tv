import 'package:get/get.dart';

import '../controllers/external_player_controller.dart';

class ExternalPlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExternalPlayerController>(
      () => ExternalPlayerController(),
    );
  }
}
