import 'package:get/get.dart';

class TimeFormatController extends GetxController {
  var selectedTimeFormat = '12'.obs;

  void setTimeFormat(String format) {
    selectedTimeFormat.value = format;
  }
}
