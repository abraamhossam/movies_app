import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/Features/home/presentations/manager/fetch_movie_details_controller.dart';
import 'package:movies_app/Features/home/presentations/manager/fetch_recommended_movies_controller.dart';
import 'package:movies_app/Features/home/presentations/manager/fetch_top_rated_movies_controller.dart';
import 'package:movies_app/Features/home/presentations/view/widgets/top_rated_movies_success_body.dart';
import 'package:movies_app/core/utils/widgets/custom_failure_body.dart';
import 'package:movies_app/core/utils/widgets/movie_details_shimmer.dart';

class TopRatedMoviesViewBody extends StatefulWidget {
  const TopRatedMoviesViewBody({super.key});

  @override
  State<TopRatedMoviesViewBody> createState() => _TopRatedMoviesViewBodyState();
}

class _TopRatedMoviesViewBodyState extends State<TopRatedMoviesViewBody> {
  final ScrollController _scrollController = ScrollController();
  final FetchTopRatedMoviesController moviecController =
      Get.find<FetchTopRatedMoviesController>();
  final FetchMovieDetailsController movieDetailsController =
      Get.find<FetchMovieDetailsController>();
  final FetchRecommendedMoviesController recommendedMoviesController =
      Get.find<FetchRecommendedMoviesController>();
  bool isLoading = false;
  int page = 2;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    if (_scrollController.position.pixels /
            _scrollController.position.maxScrollExtent >=
        1) {
      if (!isLoading) {
        isLoading = true;
        await moviecController.get(pageNumber: page++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<FetchTopRatedMoviesController>(
      builder: (controller) {
        if (controller.state.value == 'success' ||
            controller.state.value == 'pagination loading' ||
            controller.state.value == 'pagination failure') {
          return TopRatedMoviesSuccessBody(
              scrollController: _scrollController,
              controller: controller,
              movieDetailsController: movieDetailsController,
              recommendedMoviesController: recommendedMoviesController);
        } else if (controller.state.value == 'failure') {
          return CustomFailureBody(
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
            ),
            errorMessage: controller.dataFailure!.message.toString(),
          );
        } else {
          return const MovieDetailsShimmer();
        }
      },
    );
  }
}
