import 'package:dio/dio.dart';
import 'package:movies/data/movie_wrapper.dart';

import '../domain/movie.dart';
import 'constants.dart';

class MovieApiClient {
  final Dio _dio;

  MovieApiClient(this._dio);

  Future<List<Movie>> getMovies() async {
    try {
      final response = await _dio.get(
          'https://api.themoviedb.org/3/discover/movie?api_key=$API_KEY');
      final wrapper = MovieWrapper.fromJson(response.data);
      return wrapper.movies;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
