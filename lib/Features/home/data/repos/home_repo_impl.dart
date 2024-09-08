import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:movies_app/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:movies_app/Features/home/domain/entites/movie_details_entity.dart';
import 'package:movies_app/Features/home/domain/entites/movie_entity.dart';
import 'package:movies_app/Features/home/domain/repos/home_repo.dart';
import 'package:movies_app/core/errors/failure.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });
  @override
  Future<Either<Failure, List<MovieEntity>>> fetchNowPlayingMovies() async {
    List<MovieEntity> movies;
    try {
      movies = homeLocalDataSource.fetchNowPlayingMovies();
      if (movies.isNotEmpty) {
        return right(movies);
      }
      movies = await homeRemoteDataSource.fetchNowPlayingMovies();
      return right(movies);
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDiorError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchPopularMovies(
      {int pageNumber = 1}) async {
    List<MovieEntity> movies;
    try {
      movies = homeLocalDataSource.fetchPopularMovies(pageNumber: pageNumber);
      if (movies.isNotEmpty) {
        return right(movies);
      }
      movies =
          await homeRemoteDataSource.fetchPopularMovies(pageNumber: pageNumber);
      return right(movies);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchTopRatedMovies(
      {int pageNumber = 1}) async {
    List<MovieEntity> movies;
    try {
      movies = homeLocalDataSource.fetchTopRatedMovies(pageNumber: pageNumber);
      if (movies.isNotEmpty) {
        return right(movies);
      }
      movies = await homeRemoteDataSource.fetchTopRatedMovies(
          pageNumber: pageNumber);
      return right(movies);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> fetchMovieDetails(
      {required num movieId}) async {
    try {
      var movie = await homeRemoteDataSource.fetchMovieDetails(
        movieId: movieId,
      );
      return right(movie);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchRecommendedMovies(
      {required num movieId}) async {
    try {
      var movies = await homeRemoteDataSource.fetchRecommendedMovies(
        movieId: movieId,
      );
      return right(movies);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
