import 'dart:convert';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../models/movie_model.dart';

class MoviesController extends GetxController {
  var movies = <Movie>[].obs;
  var isLoading = true.obs;
  late Box<Movie> movieBox;

  @override
  void onInit() async {
    super.onInit();
    await Hive.openBox<Movie>('moviesBox');
    movieBox = Hive.box<Movie>('moviesBox');
    loadMoviesFromCache();
    fetchMovieLists();
  }

  Future<void> loadMoviesFromCache() async {
    final cachedMovies = movieBox.values.toList();
    if (cachedMovies.isNotEmpty) {
      movies.value = cachedMovies;
    }
  }

  Future<void> fetchMovieLists() async {
    isLoading(true);
    final url = Uri.parse('https://iptv-be-production.up.railway.app/api/movies');

    try {
      print('Fetching movies from: $url');

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Fetched movies: $data');
        var movieResponse = MovieResponse.fromJson(data);
        movies.value = movieResponse.results;
        cacheMovies(movieResponse.results);
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

  void cacheMovies(List<Movie> movies) {
    movieBox.clear();
    movieBox.addAll(movies);
  }
}
