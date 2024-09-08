import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/Features/home/presentations/manager/fetch_movie_details_controller.dart';
import 'package:movies_app/Features/home/presentations/manager/fetch_recommended_movies_controller.dart';
import 'package:movies_app/Features/home/presentations/view/widgets/custom_image.dart';
import 'package:movies_app/Features/home/presentations/view/widgets/movie_details_success_body.dart';
import 'package:movies_app/core/utils/widgets/custom_circular_progress_indicator.dart';
import 'package:movies_app/core/utils/widgets/custom_failure_body.dart';

class MovieDetailsViewBody extends StatelessWidget {
  const MovieDetailsViewBody({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        GetX<FetchMovieDetailsController>(
          builder: (controller) {
            if (controller.state.value == 'success') {
              return SliverToBoxAdapter(
                child: MovieDetailsSuccessBody(
                  controller: controller,
                ),
              );
            } else if (controller.state.value == 'failure') {
              return SliverToBoxAdapter(
                child: CustomFailureBody(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  height: 450,
                  errorMessage: controller.dataFailure!.message.toString(),
                ),
              );
            } else {
              return const SliverToBoxAdapter(
                child: SizedBox(
                  height: 450,
                  child: CustomCircularProgressIndicator(),
                ),
              );
            }
          },
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Text(
              "MORE LIKE THIS",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
        GetX<FetchRecommendedMoviesController>(
          builder: (controller) {
            if (controller.state.value == 'success') {
              return SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                sliver: SliverGrid.builder(
                  itemCount: controller.dataSuccess.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 7 / 9,
                  ),
                  itemBuilder: (context, index) {
                    return controller.dataSuccess[index].image != null
                        ? CustomImage(
                            img: controller.dataSuccess[index].image!,
                            aspectRatio:
                                12 / 17, //SliverGrid Remove aspectRatio
                          )
                        : null;
                  },
                ),
              );
            } else if (controller.state.value == 'failure') {
              return SliverToBoxAdapter(
                child: SizedBox(
                  child: CustomFailureBody(
                    height: 200,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    errorMessage: controller.dataFailure!.message.toString(),
                  ),
                ),
              );
            } else {
              return const SliverToBoxAdapter(
                child: SizedBox(
                  height: 200,
                  child: CustomCircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
