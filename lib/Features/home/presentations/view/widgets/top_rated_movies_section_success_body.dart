import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/Features/home/presentations/manager/fetch_movie_details_controller.dart';
import 'package:movies_app/Features/home/presentations/manager/fetch_recommended_movies_controller.dart';
import 'package:movies_app/Features/home/presentations/manager/fetch_top_rated_movies_controller.dart';
import 'package:movies_app/Features/home/presentations/view/views/movie_details_view.dart';
import 'package:movies_app/Features/home/presentations/view/widgets/custom_home_movie_item.dart';

class TopRatedMoviesSectionSuccessBody extends StatefulWidget {
  const TopRatedMoviesSectionSuccessBody({
    super.key,
    required this.controller,
  });
  final FetchTopRatedMoviesController controller;

  @override
  State<TopRatedMoviesSectionSuccessBody> createState() =>
      _TopRatedMoviesSectionSuccessBodyState();
}

class _TopRatedMoviesSectionSuccessBodyState
    extends State<TopRatedMoviesSectionSuccessBody> {
  final FetchMovieDetailsController movieDetailsController = Get.find();

  final FetchRecommendedMoviesController recommendedMoviesController =
      Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        itemCount: widget.controller.dataSuccess.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {
              Get.toNamed(
                MovieDetailsView.id,
              );
              await movieDetailsController.get(
                  movieId: widget.controller.dataSuccess[index].movieId!);
              await recommendedMoviesController.get(
                  movieId: widget.controller.dataSuccess[index].movieId!);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
              ),
              child: CustomHomeMovieItem(
                model: widget.controller.dataSuccess[index],
                aspectRatio: 12 / 17,
              ),
            ),
          );
        },
      ),
    );
  }
}