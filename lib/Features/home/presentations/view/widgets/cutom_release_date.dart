import 'package:flutter/material.dart';

class CustomReleaseData extends StatelessWidget {
  const CustomReleaseData({
    super.key,
    required this.date,
    this.color = Colors.redAccent,
  });
  final String date;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          4,
        ),
      ),
      child: Text(
        date.substring(0, 4),
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
