import 'package:dartz/dartz.dart';
import 'package:movies_app/Features/home/domain/entites/movie_entity.dart';
import 'package:movies_app/Features/home/domain/repos/home_repo.dart';
import 'package:movies_app/core/errors/failure.dart';

class FetchNowPlayingMoviesUseCase {
  final HomeRepo homeRepo;

  FetchNowPlayingMoviesUseCase({
    required this.homeRepo,
  });
  Future<Either<Failure, List<MovieEntity>>> call() async {
    return await homeRepo.fetchNowPlayingMovies();
  }
}
