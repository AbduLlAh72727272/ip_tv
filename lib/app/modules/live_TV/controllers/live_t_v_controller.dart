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
      final response = await http.get(Uri.parse('https://iptv-org.github.io/iptv/countries/pk.m3u'));
      if (response.statusCode == 200) {
        final parser = M3UParser();
        entries.value = parser.parse(response.body);
        print(response.body);
      } else {
        Get.snackbar('Error', 'Failed to load channels');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading.value = false;
    }
  }
}

class M3UEntry {
  final String title;
  final String logo;
  final String url;

  M3UEntry({required this.title, required this.logo, required this.url});
}

class M3UParser {
  List<M3UEntry> parse(String content) {
    List<M3UEntry> entries = [];
    List<String> lines = content.split('\n');
    String? title;
    String? logo;

    for (String line in lines) {
      if (line.startsWith('#EXTINF:')) {
        final titleIndex = line.indexOf(',') + 1;
        final logoIndex = line.indexOf('tvg-logo="') + 10;
        final logoEndIndex = line.indexOf('"', logoIndex);
        title = line.substring(titleIndex).trim();
        logo = logoIndex > 9 ? line.substring(logoIndex, logoEndIndex).trim() : '';
      } else if (line.startsWith('http') && title != null) {
        entries.add(M3UEntry(title: title, logo: logo ?? '', url: line.trim()));
        title = null;
        logo = null;
      }
    }

    return entries;
  }
}

