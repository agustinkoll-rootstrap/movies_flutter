import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/screens/movie_cubit.dart';
import 'package:movies/screens/home/list_tile.dart';

import '../../data/constants.dart';
import '../../domain/movie.dart';

class MyMoviesList extends StatelessWidget {
  final List<Movie> movies;

  final Function(String) callback;

  MyMoviesList({
    super.key,
    required this.movies,
    required this.callback
  });

  @override
  Widget build(BuildContext context) {
    return
        ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return MovieListTile(movie: movies[index]);
          },
        );
  }
}