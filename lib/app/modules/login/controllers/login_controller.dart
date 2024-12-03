import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final count = 0.obs;

  final TextEditingController macAddressController = TextEditingController();
  final TextEditingController pinController = TextEditingController();

  // Dummy MAC address and PIN
  final String validMacAddress = "00:1A:2B:3C:4D:5E";
  final String validPin = "1234";

  @override
  void onInit() {
    super.onInit();
    // Set initial values for the controllers
    macAddressController.text = validMacAddress;
    pinController.text = validPin;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // Dispose of the controllers when the controller is closed
    macAddressController.dispose();
    pinController.dispose();
    super.onClose();
  }

  void increment() => count.value++;

  bool validateCredentials(String macAddress, String pin) {
    return macAddress == validMacAddress && pin == validPin;
  }
}
