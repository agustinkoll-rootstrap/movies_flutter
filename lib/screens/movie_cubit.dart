import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/movie_repository.dart';
import 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {

  final MovieRepository movieRepository;

  MovieCubit( {required this.movieRepository}): super(MovieInitial());

  void getMovies() async {
    emit(MovieLoading());
    try {
      final movies = await movieRepository.getMovies();
      emit(MovieLoaded(movies: movies));
    } catch (e) {
      emit(MovieError(message: e.toString()));
    }
  }

  void filterMovies(String query) async {
    emit(MovieLoading());
    try {
      final movies = await movieRepository.filterMovies(query);
      emit(MovieLoaded(movies: movies));
    } catch (e) {
      emit(MovieError(message: e.toString()));
    }
  }
}
