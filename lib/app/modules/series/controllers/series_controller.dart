import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SeriesController extends GetxController {
  var series = <Series>[].obs;
  var isLoading = true.obs;
  var isFetchingMore = false.obs;
  var currentPage = 0;
  final int pageSize = 100;
  var allPagesLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSeries();
  }

  Future<void> fetchSeries() async {
    if (isFetchingMore.value || allPagesLoaded.value) return;

    isLoading(true);
    isFetchingMore(true);
    final url = Uri.parse('https://iptv-be-production.up.railway.app/api/series?page=$currentPage&size=$pageSize');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        final fetchedSeries = data.map((item) => Series.fromJson(item)).toList();
        if (fetchedSeries.isEmpty) {
          allPagesLoaded(true);
        } else {
          series.addAll(fetchedSeries);
          currentPage++;
        }
      } else {
        Get.snackbar('Error', 'Failed to fetch series: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading(false);
      isFetchingMore(false);
    }
  }

  Future<void> fetchNextPage() async {
    if (isFetchingMore.value || allPagesLoaded.value) return;
    await fetchSeries();
  }
}

class Series {
  final String id;
  final String name;
  final String logo;
  final String group;
  final String url;

  Series({
    required this.id,
    required this.name,
    required this.logo,
    required this.group,
    required this.url,
  });

  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      logo: json['logo'] ?? '',
      group: json['group'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
