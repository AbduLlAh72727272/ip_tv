import 'package:get/get.dart';

import '../controllers/m3_u_playlist_controller.dart';

class M3UPlaylistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<M3UPlaylistController>(
      () => M3UPlaylistController(),
    );
  }
}
