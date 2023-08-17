import '../domain/movie.dart';
import 'movie_api_client.dart';

class MovieRepository {
  final MovieApiClient movieApiClient;

  MovieRepository({required this.movieApiClient});

  Future<List<Movie>> getMovies() async {
    return await movieApiClient.getMovies();
  }
}
