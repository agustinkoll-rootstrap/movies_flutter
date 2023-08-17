import 'package:flutter/material.dart';

import '../../data/constants.dart';
import '../../domain/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;

  const MovieDetail({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  'https://image.tmdb.org/t/p/w500${movie.posterPath}?api_key=$API_KEY',
                  fit: BoxFit.cover,
                  height: 400,
                  width: double.infinity,
                  //  colorBlendMode: BlendMode.darken,
                  //   color: Colors.black.withOpacity(0.5),
                ),
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF000000),
                        Color(0x00000000),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ],
            ),
            MovieDetailBody(movie: movie),
          ],
        ),
      ),
    );
  }
}

class MovieDetailBody extends StatelessWidget {
  final Movie movie;

  MovieDetailBody({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          movie.title,
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: Colors.white),
        ),
        SizedBox(height: 10),
        Text(movie.overview,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.white, fontSize: 18)),
      ],
    );
  }
}
