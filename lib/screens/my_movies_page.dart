import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/data/constants.dart';

import '../domain/movie.dart';
import '../main.dart';
import 'MovieCubit.dart';
import 'MovieState.dart';

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
          body: MyMoviesController(),
        ));
  }
}

class MyMoviesController extends StatelessWidget {
  const MyMoviesController({
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
          return MyMoviesList(movies: state.movies);
        } else {
          return const Center(
            child: Text('Something went wrong!'),
          );
        }
      },
    );
  }
}

class MyMoviesList extends StatelessWidget {
  final List<Movie> movies;

  MyMoviesList({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return ListTile(movie: movies[index]);
      },
    );
  }
}

class ListTile extends StatelessWidget {
  const ListTile({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed('movie', extra: movie);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          borderOnForeground: true,
          elevation: 10,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(movie.title, style: Theme.of(context).textTheme.bodyLarge,),
                        SizedBox(height: 16.0),
                        Text(movie.overview, maxLines: 5, softWrap: true, overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all( Radius.circular(8.0)),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}?api_key=$API_KEY',
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
