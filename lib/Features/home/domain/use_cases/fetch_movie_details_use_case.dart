import 'package:dartz/dartz.dart';
import 'package:movies_app/Features/home/domain/entites/movie_details_entity.dart';
import 'package:movies_app/Features/home/domain/repos/home_repo.dart';
import 'package:movies_app/core/errors/failure.dart';

class FetchMovieDetailsUseCase {
  final HomeRepo homeRepo;

  FetchMovieDetailsUseCase({required this.homeRepo});
  Future<Either<Failure, MovieDetailsEntity>> call({required num id}) async {
    return await homeRepo.fetchMovieDetails(
      movieId: id,
    );
  }
}
