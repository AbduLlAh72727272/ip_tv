import 'package:get/get.dart';

class LoginController extends GetxController {
  final count = 0.obs;

  // Dummy MAC address and PIN
  final String validMacAddress = "00:1A:2B:3C:4D:5E";
  final String validPin = "1234";

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  bool validateCredentials(String macAddress, String pin) {
    return macAddress == validMacAddress && pin == validPin;
  }
}
