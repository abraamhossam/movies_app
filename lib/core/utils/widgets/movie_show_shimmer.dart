import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/size_config.dart';
import 'package:shimmer/shimmer.dart';

class CustomNowPlayingSectionShimmer extends StatelessWidget {
  const CustomNowPlayingSectionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      width: SizeConfig.width,
      height: SizeConfig.height! * 0.4,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
