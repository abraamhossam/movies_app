import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/Features/home/presentations/manager/fetch_movie_details_controller.dart';
import 'package:movies_app/Features/home/presentations/view/widgets/cutom_release_date.dart';
import 'package:movies_app/Features/home/presentations/view/widgets/movie_rating.dart';
import 'package:movies_app/core/utils/size_config.dart';

class MovieDetailsSuccessBody extends StatelessWidget {
  const MovieDetailsSuccessBody({
    super.key,
    required this.controller,
  });
  final FetchMovieDetailsController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SizedBox(
              width: SizeConfig.width,
              child: AspectRatio(
                aspectRatio: SizeConfig.width! / 220,
                child: CachedNetworkImage(
                  imageUrl:
                      'https://image.tmdb.org/t/p/w500${controller.dataSuccess!.image}',
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 8,
          ),
          child: Text(
            controller.dataSuccess!.movieTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: Row(
            children: [
              CustomReleaseData(
                date: controller.dataSuccess!.date,
                color: Colors.grey.withOpacity(0.2),
              ),
              const SizedBox(
                width: 16,
              ),
              MovieRating(
                rating: controller.dataSuccess!.rating,
              ),
              const SizedBox(
                width: 32,
              ),
              Text(
                "${((controller.dataSuccess!.time) / 60).toInt()}h ${((controller.dataSuccess!.time) % 60).toInt()}m",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.15,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 8,
          ),
          child: Text(
            controller.dataSuccess!.description,
            style: GoogleFonts.poppins(
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: Row(
            children: [
              SizedBox(
                height: 40,
                child: Text(
                  "Genres:",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ListView.builder(
                    itemCount: controller.dataSuccess!.genresList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                        ),
                        child: Text(
                          "${controller.dataSuccess!.genresList[index].name},",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
