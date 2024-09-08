import 'package:dartz/dartz.dart';
import 'package:movies_app/Features/home/domain/entites/movie_entity.dart';
import 'package:movies_app/Features/home/domain/repos/home_repo.dart';
import 'package:movies_app/core/errors/failure.dart';

class FetchPopularMoviesUseCase {
  final HomeRepo homeRepo;

  FetchPopularMoviesUseCase({
    required this.homeRepo,
  });
  Future<Either<Failure, List<MovieEntity>>> call({int pageNum = 1}) async {
    return await homeRepo.fetchPopularMovies(pageNumber: pageNum);
  }
}
