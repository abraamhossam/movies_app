import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/Features/home/domain/entites/movie_entity.dart';
import 'package:movies_app/Features/home/presentations/view/widgets/custom_image.dart';
import 'package:movies_app/Features/home/presentations/view/widgets/cutom_release_date.dart';
import 'package:movies_app/Features/home/presentations/view/widgets/movie_rating.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.model,
  });
  final MovieEntity model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 140,
              child: CustomImage(
                img: model.image ?? "",
                aspectRatio: 11 / 17,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.movieTitle ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      CustomReleaseData(
                        date: model.date ?? '0000',
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      MovieRating(
                        rating: model.rating ?? 0,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    model.description ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
