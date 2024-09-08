import 'package:flutter/material.dart';

class PaginationLoading extends StatelessWidget {
  const PaginationLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.all(
          8,
        ),
        decoration: const ShapeDecoration(
          shape: CircleBorder(),
          color: Colors.white,
        ),
        child: const Center(
          child: CircularProgressIndicator(
            strokeWidth: 3,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
