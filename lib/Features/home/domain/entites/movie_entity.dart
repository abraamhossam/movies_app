import 'package:hive/hive.dart';
part 'movie_entity.g.dart';

@HiveType(typeId: 0)
class MovieEntity {
  @HiveField(0)
  final num? movieId;
  @HiveField(1)
  final String? movieTitle;
  @HiveField(2)
  final String? image;
  @HiveField(3)
  final num? rating;
  @HiveField(4)
  final String? description;
  @HiveField(5)
  final String? date;

  MovieEntity({
    required this.movieId,
    required this.movieTitle,
    required this.image,
    required this.rating,
    required this.description,
    required this.date,
  });
}
