import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:movies_app/Features/home/presentations/view/views/popular_movies_view.dart';
import 'package:movies_app/Features/home/presentations/view/views/top_rated_movies_view.dart';
import 'package:movies_app/Features/home/presentations/view/widgets/custom_header.dart';
import 'package:movies_app/Features/home/presentations/view/widgets/now_playing_movies_section.dart';
import 'package:movies_app/Features/home/presentations/view/widgets/popular_movies_section.dart';
import 'package:movies_app/Features/home/presentations/view/widgets/top_rated_movies_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const NowPlayingMoviesSection(),
          CustomHeader(
            text: 'Popular',
            ontap: () async {
              Get.toNamed(PopularMoviesView.id);
            },
          ),
          const PopularMoviesSection(),
          CustomHeader(
            text: 'Top Rated',
            ontap: () {
              Get.toNamed(TopRatedMoviesView.id);
            },
          ),
          const TopRatedMoviesSection(),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
