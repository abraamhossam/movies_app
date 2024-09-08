import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/Features/home/presentations/manager/fetch_now_playing_movies_controller.dart';
import 'package:movies_app/Features/home/presentations/view/widgets/now_playing_movies_section_success_body.dart';
import 'package:movies_app/core/utils/size_config.dart';
import 'package:movies_app/core/utils/widgets/custom_failure_body.dart';
import 'package:movies_app/core/utils/widgets/movie_shimmer.dart';

class NowPlayingMoviesSection extends StatelessWidget {
  const NowPlayingMoviesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetX<FetchNowPlayingMoviesController>(
      builder: (controller) {
        if (controller.state.value == 'success') {
          return NowPlayingMoviesSectionSuccessBody(
            controller: controller,
          );
        } else if (controller.state.value == 'failure') {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
            ),
            child: CustomFailureBody(
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
              ),
              height: SizeConfig.height! * 0.4,
              errorMessage: controller.dataFailure!.message.toString(),
            ),
          );
        } else {
          return const MovieShimmer();
        }
      },
    );
  }
}
