import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:movies_app/Features/home/domain/entites/movie_entity.dart';

class CustomHomeMovieItem extends StatelessWidget {
  const CustomHomeMovieItem({
    super.key,
    required this.aspectRatio,
    required this.model,
  });
  final double aspectRatio;
  final MovieEntity model;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        8,
      ),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: CachedNetworkImage(
          width: 120,
          fit: BoxFit.fill,
          imageUrl: 'https://image.tmdb.org/t/p/w500/${model.image!}',
        ),
      ),
    );
  }
}
