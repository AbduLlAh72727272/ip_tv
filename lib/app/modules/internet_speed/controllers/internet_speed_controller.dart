import 'dart:async';
import 'package:flutter_internet_speed_test/flutter_internet_speed_test.dart';
import 'package:get/get.dart';

class InternetSpeedController extends GetxController {
  final RxDouble speed = 0.0.obs;
  final FlutterInternetSpeedTest _internetSpeedTest = FlutterInternetSpeedTest();
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    testInternetSpeed();
  }

  void testInternetSpeed() {
    _timer?.cancel();
    speed.value = 0.0;

    _internetSpeedTest.startTesting(
      onCompleted: (TestResult download, TestResult upload) {
        if (_timer != null && _timer!.isActive) {
          speed.value = download.transferRate;
        }
        _timer?.cancel();
      },
      onError: (String errorMessage, String errorDetails) {
        print('Error: $errorMessage');
      },
      onProgress: (double percent, TestResult data) {
        if (_timer != null && _timer!.isActive) {
          speed.value = data.transferRate;
        }
      },
      onStarted: () {
        _timer = Timer(Duration(seconds: 10), () {
          _internetSpeedTest.cancelTest();
        });
      },
    );
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
