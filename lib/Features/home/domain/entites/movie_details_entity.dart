import 'package:movies_app/Features/home/data/models/movie_details_model/genre.dart';

class MovieDetailsEntity {
  final num movieDetailsId;
  final String movieTitle;
  final String date;
  final String image;
  final num rating;
  final String description;
  final List<Genre> genresList;
  final num time;

  MovieDetailsEntity({
    required this.movieDetailsId,
    required this.movieTitle,
    required this.date,
    required this.image,
    required this.rating,
    required this.description,
    required this.genresList,
    required this.time,
  });
}
