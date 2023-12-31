import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';
import '../movie_cubit.dart';
import '../movie_state.dart';
import 'movie_search.dart';
import 'my_movies_list.dart';

class MyMoviesPage extends StatelessWidget {
  const MyMoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MovieCubit>(),
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            'Movies',
            style: Theme.of(context)
                .appBarTheme
                .titleTextStyle
                ?.copyWith(color: Colors.white),
          ),
        ),
        body: const Column(
          children: [
            SearchField(),
            SizedBox(
              height: 10,
            ),
            Expanded(child: MovieListController()),
          ],
        ),
      ),
    );
  }
}

class MovieListController extends StatelessWidget {
  const MovieListController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      bloc: BlocProvider.of<MovieCubit>(context)..getMovies(),
      builder: (context, state) {
        if (state is MovieInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MovieLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MovieLoaded) {
          return MyMoviesList(
            movies: state.movies,
          );
        } else {
          return Center(
            child: Text(
              'Something went wrong!',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.white),
            ),
          );
        }
      },
    );
  }
}
