import 'package:get/get.dart';
import 'package:movies_app/Features/home/domain/entites/movie_details_entity.dart';
import 'package:movies_app/Features/home/domain/use_cases/fetch_movie_details_use_case.dart';
import 'package:movies_app/core/errors/failure.dart';

class FetchMovieDetailsController extends GetxController {
  final FetchMovieDetailsUseCase fetchMovieDetailsUseCase;

  FetchMovieDetailsController({required this.fetchMovieDetailsUseCase});
  Rx<String> state = ''.obs;
  MovieDetailsEntity? dataSuccess;
  Failure? dataFailure;

  Future<void> get({required num movieId}) async {
    state.value = 'loading';
    var result = await fetchMovieDetailsUseCase.call(
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
