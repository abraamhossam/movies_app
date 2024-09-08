import 'package:dartz/dartz.dart';
import 'package:movies_app/Features/home/domain/entites/movie_entity.dart';
import 'package:movies_app/Features/home/domain/repos/home_repo.dart';
import 'package:movies_app/core/errors/failure.dart';

class FetchRecommendedMoviesUseCase {
  final HomeRepo homeRepo;

  FetchRecommendedMoviesUseCase({required this.homeRepo});
  Future<Either<Failure, List<MovieEntity>>> call({required num id}) async {
    return await homeRepo.fetchRecommendedMovies(movieId: id);
  }
}
