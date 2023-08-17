import 'package:go_router/go_router.dart';
import 'package:movies/screens/detail/movie_detail_screen.dart';
import 'package:movies/screens/my_movies_page.dart';

import 'domain/movie.dart';

class Routers{
  static GoRouter authRouter = GoRouter(
    initialLocation: "/movies",
    routes: [
      GoRoute(
        name: "movie",
        path: "/movie",
        builder: (context, state) => MovieDetail(movie: state.extra as Movie),
      ),
      GoRoute(
        name: "movies",
        path: "/movies",
        builder: (context, state) => const MyMoviesPage(),
      ),
    ],
  );
}