import '../domain/movie.dart';
import 'movie_api_client.dart';

class MovieRepository {
  final MovieApiClient movieApiClient;

  MovieRepository({required this.movieApiClient});

  Future<List<Movie>> getMovies() async {
    return await movieApiClient.getMovies();
  }

  Future<List<Movie>> filterMovies(String query) async {
    final movies = await movieApiClient.getMovies();
    final filtered = movies.where((movie) => movie.title.toLowerCase().contains(query.toLowerCase()));
    return filtered.toList();
  }
}
