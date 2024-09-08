import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movies_app/Features/home/presentations/manager/fetch_movie_details_controller.dart';
import 'package:movies_app/Features/home/presentations/manager/fetch_popular_movies_controller.dart';
import 'package:movies_app/Features/home/presentations/manager/fetch_recommended_movies_controller.dart';
import 'package:movies_app/Features/home/presentations/view/views/movie_details_view.dart';
import 'package:movies_app/Features/home/presentations/view/widgets/movie_card.dart';
import 'package:movies_app/core/utils/widgets/pagination_loading.dart';

class PopularMoviesViewSuccessBody extends StatelessWidget {
  const PopularMoviesViewSuccessBody({
    super.key,
    required ScrollController scrollController,
    required this.movieDetailsController,
    required this.recommendedMoviesController,
    required this.controller,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;
  final FetchPopularMoviesController controller;
  final FetchMovieDetailsController movieDetailsController;
  final FetchRecommendedMoviesController recommendedMoviesController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          controller: _scrollController,
          itemCount: controller.allMovies.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () async {
                Get.toNamed(MovieDetailsView.id);
                await movieDetailsController.get(
                  movieId: controller.allMovies[index].movieId ?? 4,
                );
                await recommendedMoviesController.get(
                  movieId: controller.allMovies[index].movieId ?? 4,
                );
              },
              child: MovieCard(
                model: controller.allMovies[index],
              ),
            );
          },
        ),
        controller.state.value == 'pagination loading'
            ? const PaginationLoading()
            : const Text(""),
      ],
    );
  }
}
