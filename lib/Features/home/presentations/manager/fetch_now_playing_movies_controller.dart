import 'package:get/get.dart';
import 'package:movies_app/Features/home/domain/entites/movie_entity.dart';
import 'package:movies_app/Features/home/domain/use_cases/fetch_now_playing_movies_use_case.dart';
import 'package:movies_app/core/errors/failure.dart';

class FetchNowPlayingMoviesController extends GetxController {
  final FetchNowPlayingMoviesUseCase fetchNowPlayingMoviesUseCase;

  FetchNowPlayingMoviesController({
    required this.fetchNowPlayingMoviesUseCase,
  });
  Rx<String> state = ''.obs;
  List<MovieEntity> dataSuccess = <MovieEntity>[];
  Failure? dataFailure;
  Future<void> get() async {
    state.value = 'loading';
    var result = await fetchNowPlayingMoviesUseCase.call();
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
