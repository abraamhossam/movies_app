import 'package:flutter/material.dart';

class MovieRating extends StatelessWidget {
  const MovieRating({
    super.key,
    required this.rating,
  });

  final num rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amberAccent,
          size: 20,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          rating.toString().substring(0, 3),
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
