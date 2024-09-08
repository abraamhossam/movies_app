import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/Features/home/presentations/manager/fetch_movie_details_controller.dart';
import 'package:movies_app/Features/home/presentations/manager/fetch_popular_movies_controller.dart';
import 'package:movies_app/Features/home/presentations/manager/fetch_recommended_movies_controller.dart';
import 'package:movies_app/Features/home/presentations/view/widgets/popular_movies_view_success_body.dart';
import 'package:movies_app/core/utils/widgets/movie_details_shimmer.dart';

class PopularMoviesViewBody extends StatefulWidget {
  const PopularMoviesViewBody({super.key});

  @override
  PopularMoviesViewBodyState createState() => PopularMoviesViewBodyState();
}

class PopularMoviesViewBodyState extends State<PopularMoviesViewBody> {
  final ScrollController _scrollController = ScrollController();
  final FetchPopularMoviesController moviecController =
      Get.find<FetchPopularMoviesController>();
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
        await moviecController.get(
          pageNumber: page++,
        );
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
    return GetX<FetchPopularMoviesController>(
      builder: (controller) {
        if (controller.state.value == 'success' ||
            controller.state.value == 'pagination loading' ||
            controller.state.value == 'pagination failure') {
          return PopularMoviesViewSuccessBody(
            scrollController: _scrollController,
            controller: controller,
            movieDetailsController: movieDetailsController,
            recommendedMoviesController: recommendedMoviesController,
          );
        } else if (controller.state.value == 'failure') {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                controller.dataFailure!.message.toString(),
              ),
            ),
          );
        } else {
          return const MovieDetailsShimmer();
        }
      },
    );
  }
}
