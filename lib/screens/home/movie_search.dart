import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../movie_cubit.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        decoration: const InputDecoration(
          hintText: 'Enter a movie title',
          hintStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
        ),
        style: const TextStyle(color: Colors.white),
        onSubmitted: (value) {
          //callback(value);
        },
        onChanged: (value) {
          BlocProvider.of<MovieCubit>(context).filterMovies(value);
        },
      ),
    );
  }
}