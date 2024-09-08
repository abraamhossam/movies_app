import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/Features/home/presentations/view/widgets/popular_movies_view_body.dart';

class PopularMoviesView extends StatelessWidget {
  const PopularMoviesView({super.key});
  static String id = '/PopularMoviesView';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          title: Text(
            "Popular Movies",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
            ),
          ),
          centerTitle: true,
        ),
        body: const PopularMoviesViewBody(),
      ),
    );
  }
}
