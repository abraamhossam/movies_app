import 'package:flutter/material.dart';
import 'package:movies_app/Features/home/presentations/view/widgets/movie_details_view_body.dart';
import 'package:movies_app/core/utils/size_config.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});
  static String id = '/MovieDetailsView';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const SafeArea(
      child: Scaffold(
        body: MovieDetailsViewBody(),
      ),
    );
  }
}
