import 'package:get/get.dart';
import 'package:movies_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:movies_app/Features/home/domain/use_cases/fetch_movie_details_use_case.dart';
import 'package:movies_app/Features/home/domain/use_cases/fetch_now_playing_movies_use_case.dart';
import 'package:movies_app/Features/home/domain/use_cases/fetch_popular_movies_use_case.dart';
import 'package:movies_app/Features/home/domain/use_cases/fetch_recommended_movies_use_case.dart';
import 'package:movies_app/Features/home/domain/use_cases/fetch_top_rated_moview_use_case.dart';
import 'package:movies_app/Features/home/presentations/manager/fetch_movie_details_controller.dart';
import 'package:movies_app/Features/home/presentations/manager/fetch_now_playing_movies_controller.dart';
import 'package:movies_app/Features/home/presentations/manager/fetch_popular_movies_controller.dart';
import 'package:movies_app/Features/home/presentations/manager/fetch_recommended_movies_controller.dart';
import 'package:movies_app/Features/home/presentations/manager/fetch_top_rated_movies_controller.dart';
import 'package:movies_app/core/utils/functions/setup_service_locator.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      FetchNowPlayingMoviesController(
        fetchNowPlayingMoviesUseCase: FetchNowPlayingMoviesUseCase(
          homeRepo: getIt.get<HomeRepoImpl>(),
        ),
      ),
    ).get();
    Get.put(
      FetchPopularMoviesController(
        fetchPopularMoviesUseCase: FetchPopularMoviesUseCase(
          homeRepo: getIt.get<HomeRepoImpl>(),
        ),
      ),
    ).get();
    Get.put(
      FetchTopRatedMoviesController(
        fetchTopRatedMoviewUseCase: FetchTopRatedMoviewUseCase(
          homeRepo: getIt.get<HomeRepoImpl>(),
        ),
      ),
    ).get();
    Get.put(
      FetchMovieDetailsController(
        fetchMovieDetailsUseCase: FetchMovieDetailsUseCase(
          homeRepo: getIt.get<HomeRepoImpl>(),
        ),
      ),
    );
    Get.put(
      FetchRecommendedMoviesController(
        fetchRecommendedMoviesUseCase: FetchRecommendedMoviesUseCase(
          homeRepo: getIt.get<HomeRepoImpl>(),
        ),
      ),
    );
  }
}
