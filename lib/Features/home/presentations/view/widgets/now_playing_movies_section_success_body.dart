import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Features/home/presentations/manager/fetch_now_playing_movies_controller.dart';
import 'package:movies_app/core/utils/size_config.dart';

class NowPlayingMoviesSectionSuccessBody extends StatelessWidget {
  const NowPlayingMoviesSectionSuccessBody({
    super.key,
    required this.controller,
  });
  final FetchNowPlayingMoviesController controller;
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: SizedBox(
        width: SizeConfig.width,
        child: CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1.0,
            height: SizeConfig.height! * 0.4,
            onPageChanged: (index, reason) {},
          ),
          items: controller.dataSuccess.map(
            (item) {
              return GestureDetector(
                onTap: () {
                  /// TODO : NAVIGATE TO MOVIE DETAILS
                },
                child: Stack(
                  children: [
                    ShaderMask(
                      shaderCallback: (rect) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            // fromLTRB
                            Colors.transparent,
                            Colors.black,
                            Colors.black,
                            Colors.transparent,
                          ],
                          stops: [0, 0.3, 0.5, 1],
                        ).createShader(
                          Rect.fromLTRB(0, 0, rect.width, rect.height),
                        );
                      },
                      blendMode: BlendMode.dstIn,
                      child: CachedNetworkImage(
                        width: SizeConfig.width,
                        height: SizeConfig.height! * 0.4,
                        imageUrl:
                            'https://image.tmdb.org/t/p/w500/${item.image}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.circle,
                                  color: Colors.redAccent,
                                  size: 16.0,
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                  'Now Playing'.toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Text(
                              item.movieTitle!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
