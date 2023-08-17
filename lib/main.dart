import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/data/movieRepository.dart';
import 'package:movies/data/movie_api_client.dart';
import 'package:movies/screens/MovieCubit.dart';
import 'package:movies/screens/my_movies_page.dart';

import 'navigation.dart';

final getIt = GetIt.instance;

void main() {
  runApp(const MyApp());
  initialize();
}

Future<void> initialize() async {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<MovieApiClient>(() => MovieApiClient(getIt<Dio>()));
  getIt.registerLazySingleton<MovieRepository>(() => MovieRepository(movieApiClient: getIt<MovieApiClient>()));
  getIt.registerLazySingleton(() => MovieCubit( movieRepository: getIt<MovieRepository>()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  GoRouter get _goRouter => Routers.authRouter;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        appBarTheme:Theme.of(context).appBarTheme.copyWith(foregroundColor: Colors.white),
        useMaterial3: true,
      ),
      routerConfig: _goRouter,
    );
  }
}
