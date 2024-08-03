import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LiveTVController extends GetxController {
  var isLoading = true.obs;
  var entries = <M3UEntry>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchM3U();
  }

  Future<void> fetchM3U() async {
    isLoading(true);
    try {
      final response = await http.get(Uri.parse('https://iptv-be-production.up.railway.app/api/channels'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        entries.value = data.map((item) => M3UEntry.fromJson(item)).toList();
      } else {
        print('Failed to load channels: ${response.statusCode}');
        Get.snackbar('Error', 'Failed to load channels');
      }
    } catch (e) {
      print('Error occurred: $e');
      Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading.value = false;
    }
  }
}

class M3UEntry {
  final String id;
  final String displayName;
  final String icon;
  final String group;
  final String logo;
  final String url;

  M3UEntry({
    required this.id,
    required this.displayName,
    required this.icon,
    required this.group,
    required this.logo,
    required this.url,
  });

  factory M3UEntry.fromJson(Map<String, dynamic> json) {
    return M3UEntry(
      id: json['id'] ?? '',
      displayName: json['displayName'] ?? '',
      icon: json['icon'] ?? '',
      group: json['group'] ?? '',
      logo: json['logo'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
