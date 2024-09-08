import 'package:flutter/material.dart';

class SeeMoreButton extends StatelessWidget {
  const SeeMoreButton({
    super.key,
    this.ontap,
  });
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text('See More'),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.0,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
