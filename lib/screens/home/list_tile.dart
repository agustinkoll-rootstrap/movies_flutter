import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/constants.dart';
import '../../domain/movie.dart';

class MovieListTile extends StatelessWidget {
  const MovieListTile({
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
                        Text(
                          movie.title,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          movie.overview,
                          maxLines: 5,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
