import 'package:hive/hive.dart';

part 'movie_model.g.dart';

@HiveType(typeId: 0)
class Movie {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String logo;

  @HiveField(3)
  final String group;

  @HiveField(4)
  final String url;

  Movie({
    required this.id,
    required this.name,
    required this.logo,
    required this.group,
    required this.url,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      logo: json['logo'] ?? '',
      group: json['group'] ?? '',
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
      'group': group,
      'url': url,
    };
  }
}

class MovieResponse {
  final List<Movie> results;

  MovieResponse({required this.results});

  factory MovieResponse.fromJson(List<dynamic> json) {
    List<Movie> moviesList = json.map((i) => Movie.fromJson(i)).toList();
    return MovieResponse(results: moviesList);
  }
}
