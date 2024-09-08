import 'dart:async';

import 'package:get/get.dart';

import 'package:movies_app/Features/home/domain/entites/movie_entity.dart';
import 'package:movies_app/Features/home/domain/use_cases/fetch_popular_movies_use_case.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/utils/functions/show_snakbar.dart';

class FetchPopularMoviesController extends GetxController {
  Rx<String> state = ''.obs;
  Rx<String> load = ''.obs;
  List<MovieEntity> dataSuccess = <MovieEntity>[];
  RxList<MovieEntity> allMovies = <MovieEntity>[].obs;
  Failure? dataFailure;
  final FetchPopularMoviesUseCase fetchPopularMoviesUseCase;

  FetchPopularMoviesController({
    required this.fetchPopularMoviesUseCase,
  });
  Future<void> get({int pageNumber = 1}) async {
    if (pageNumber == 1) {
      state.value = 'loading';
    } else {
      state.value = 'pagination loading';
    }
    var result = await fetchPopularMoviesUseCase.call(
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
