import 'package:get/get.dart';
import 'package:movies_app/Features/home/domain/entites/movie_entity.dart';
import 'package:movies_app/Features/home/domain/use_cases/fetch_recommended_movies_use_case.dart';
import 'package:movies_app/core/errors/failure.dart';

class FetchRecommendedMoviesController extends GetxController {
  final FetchRecommendedMoviesUseCase fetchRecommendedMoviesUseCase;

  FetchRecommendedMoviesController(
      {required this.fetchRecommendedMoviesUseCase});
  Rx<String> state = ''.obs;
  List<MovieEntity> dataSuccess = <MovieEntity>[];
  Failure? dataFailure;
  Future<void> get({required num movieId}) async {
    state.value = 'loading';
    var result = await fetchRecommendedMoviesUseCase.call(
      id: movieId,
    );
    result.fold(
      (l) {
        dataFailure = l;
        state.value = 'failure';
      },
      (r) {
        dataSuccess = r;
        state.value = 'success';
      },
    );
  }
}
