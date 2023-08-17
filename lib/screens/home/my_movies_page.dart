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
            SizedBox(height: 10,),
            Expanded(child: MyMoviesController()),
          ],
        ),
      ),
    );
  }
}

class MyMoviesController extends StatefulWidget {
  const MyMoviesController({
    super.key,
  });

  @override
  State<MyMoviesController> createState() => _MyMoviesControllerState();
}

class _MyMoviesControllerState extends State<MyMoviesController> {
  String query = "";

  void onQueryChanged(String newValue) {
    setState(() {
      query = newValue;
    });
  }

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
            callback: onQueryChanged,
          );
        } else {
          return const Center(
            child: Text('Something went wrong!'),
          );
        }
      },
    );
  }
}
