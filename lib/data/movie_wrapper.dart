import '../domain/movie.dart';

class MovieWrapper{
  final List<Movie> movies;

  MovieWrapper({required this.movies});

  factory MovieWrapper.fromJson(Map<String, dynamic> json){
    var list = json['results'] as List;
    List<Movie> movies = list.map((i) => Movie.fromJson(i)).toList();

    return MovieWrapper(
      movies: movies
    );
  }
}