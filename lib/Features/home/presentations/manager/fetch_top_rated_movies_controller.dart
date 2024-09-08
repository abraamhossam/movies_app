import 'package:get/get.dart';
import 'package:movies_app/Features/home/domain/entites/movie_entity.dart';
import 'package:movies_app/Features/home/domain/use_cases/fetch_top_rated_moview_use_case.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/utils/functions/show_snakbar.dart';

class FetchTopRatedMoviesController extends GetxController {
  final FetchTopRatedMoviewUseCase fetchTopRatedMoviewUseCase;

  FetchTopRatedMoviesController({
    required this.fetchTopRatedMoviewUseCase,
  });
  Rx<String> state = ''.obs;
  List<MovieEntity> dataSuccess = <MovieEntity>[];
  RxList<MovieEntity> allMovies = <MovieEntity>[].obs;
  Failure? dataFailure;
  Future<void> get({int pageNumber = 1}) async {
    if (pageNumber == 1) {
      state.value = 'loading';
    } else {
      state.value = 'pagination loading';
    }
    var result = await fetchTopRatedMoviewUseCase.call(
      pageNum: pageNumber,
    );
    result.fold(
      (l) {
        if (pageNumber == 1) {
          state.value = 'failure';
        } else {
          showSnakBar(l);
          state.value = 'pagination failure';
        }
      },
      (r) {
        if (pageNumber == 1) {
          dataSuccess = r;
        }
        allMovies.addAll(r);
        state.value = 'success';
      },
    );
  }
}
