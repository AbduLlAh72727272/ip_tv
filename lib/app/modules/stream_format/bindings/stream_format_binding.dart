import 'package:get/get.dart';

import '../controllers/stream_format_controller.dart';

class StreamFormatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StreamFormatController>(
      () => StreamFormatController(),
    );
  }
}
