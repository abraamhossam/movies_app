import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/Features/home/presentations/manager/fetch_popular_movies_controller.dart';
import 'package:movies_app/Features/home/presentations/view/widgets/popular_movies_section_success_body.dart';
import 'package:movies_app/core/utils/widgets/custom_failure_body.dart';
import 'package:movies_app/core/utils/widgets/movie_shimmer.dart';

class PopularMoviesSection extends StatelessWidget {
  const PopularMoviesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetX<FetchPopularMoviesController>(
      builder: (controller) {
        if (controller.state.value == 'success') {
          return PopularMoviesSectionSuccessBody(
            controller: controller,
          );
        } else if (controller.state.value == 'failure') {
          return CustomFailureBody(
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
            ),
            height: 160,
            errorMessage: controller.dataFailure!.message.toString(),
          );
        } else {
          return const MovieShimmer();
        }
      },
    );
  }
}
