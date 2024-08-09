import 'package:get/get.dart';

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';

  String get allInCaps => this.toUpperCase();

  // String get capitalizeFirstofEach => this.split(" ").map((str) => str.capitalize).join(" ");

  String get toCode {
    switch (this) {
      case "Spanish":
        return "es";
      default:
        return "en";
    }
  }
  String get toLanguage {
    switch (this) {
      case "es":
        return "Spanish";
      default:
        return "English";
    }
  }
}
