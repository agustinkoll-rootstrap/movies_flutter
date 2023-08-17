class Movie {
  final int id;
  final String title;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final double voteAverage;
  final String releaseDate;

  Movie(
      {required this.id,
      required this.title,
      this.posterPath = "",
      this.backdropPath = "",
      this.overview = "",
      this.voteAverage = 0.0,
      this.releaseDate = ""});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json['id'],
        title: json['title'],
        posterPath: json['poster_path'],
        backdropPath: json['backdrop_path'],
        overview: json['overview'],
        voteAverage: json['vote_average'].toDouble(),
        releaseDate: json['release_date']);
  }
}
