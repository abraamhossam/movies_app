import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.img,
    required this.aspectRatio,
  });

  final String img;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        12,
      ),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: CachedNetworkImage(
          width: 120,
          fit: BoxFit.fill,
          imageUrl: 'https://image.tmdb.org/t/p/w500/$img',
        ),
      ),
    );
  }
}
