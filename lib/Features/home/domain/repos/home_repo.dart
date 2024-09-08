import 'package:dartz/dartz.dart';
import 'package:movies_app/Features/home/domain/entites/movie_details_entity.dart';
import 'package:movies_app/Features/home/domain/entites/movie_entity.dart';
import 'package:movies_app/core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MovieEntity>>> fetchNowPlayingMovies();
  Future<Either<Failure, List<MovieEntity>>> fetchPopularMovies(
      {int pageNumber = 1});
  Future<Either<Failure, List<MovieEntity>>> fetchTopRatedMovies(
      {int pageNumber = 1});

  Future<Either<Failure, MovieDetailsEntity>> fetchMovieDetails(
      {required num movieId});
  Future<Either<Failure, List<MovieEntity>>> fetchRecommendedMovies(
      {required num movieId});
}
