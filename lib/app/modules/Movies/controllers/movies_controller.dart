import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/movie_model.dart';



class MoviesController extends GetxController {
  var movies = <Movie>[].obs;
  var isLoading = true.obs;
  var movieList = ['now_playing', 'popular', 'top_rated', 'upcoming'];

  @override
  void onInit() {
    fetchMovieLists();
    super.onInit();
  }

  final String apiKey = '541cb4833986917ac776a27ca3b13489';
  final String token = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1NDFjYjQ4MzM5ODY5MTdhYzc3NmEyN2NhM2IxMzQ4OSIsIm5iZiI6MTcyMTk4MTkwMi42OTY1NzMsInN1YiI6IjY2YTI0YjkwNDQyZWU5NTc1ZjA1ZjhiNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MbP3TcyrSs-_LqVJbZboqbPvX2TrQFigEMzHMdKETJc';


  Future<void> fetchMovieLists() async {
    isLoading(true);
    final url = Uri.parse('https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1');

    try {
      print('Fetching movies from: $url');

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Fetched movies: $data');
        var movieResponse = MovieResponse.fromJson(data);
        movies.value = movieResponse.results;

      } else {
        final data = json.decode(response.body);
        print('Error response data: $data');
        Get.snackbar('Error', 'Failed to fetch Movie lists: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
      print('Movie List error: $e');
    } finally {
      isLoading(false);
    }
  }


}
