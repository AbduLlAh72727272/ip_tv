import 'package:get/get.dart';

class MultiscreenController extends GetxController {


  var selectedUrls = List<String?>.filled(4, null, growable: false).obs;

  void updateUrl(int index, String? url) {
    if (index >= 0 && index < selectedUrls.length) {
      selectedUrls[index] = url;
    }
  }

  //
  // var selectedUrls = <String>[].obs;
  //
  // void addUrl(String url) {
  //   if (selectedUrls.length < 4 && !selectedUrls.contains(url)) {
  //     selectedUrls.add(url);
  //   }
  // }
  //
  // void removeUrl(String url) {
  //   selectedUrls.remove(url);
  // }
  //
  // void replaceUrl(int index, String url) {
  //   if (index >= 0 && index < selectedUrls.length) {
  //     selectedUrls[index] = url;
  //   }
  // }


  // //TODO: Implement MultiscreenController
  //
  // final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }
  //
  // @override
  // void onReady() {
  //   super.onReady();
  // }
  //
  // @override
  // void onClose() {
  //   super.onClose();
  // }
  //
  // void increment() => count.value++;
}
