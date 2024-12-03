import 'package:get/get.dart';

class StreamFormatController extends GetxController {
  var selectedFormat = ''.obs;

  void setSelectedFormat(String format) {
    selectedFormat.value = format;
  }

  bool isSelected(String format) {
    return selectedFormat.value == format;
  }
}
