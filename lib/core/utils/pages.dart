import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movies_app/Features/home/presentations/view/views/home_view.dart';
import 'package:movies_app/Features/home/presentations/view/views/movie_details_view.dart';
import 'package:movies_app/Features/home/presentations/view/views/popular_movies_view.dart';
import 'package:movies_app/Features/home/presentations/view/views/top_rated_movies_view.dart';

List<GetPage<dynamic>>? pages = [
  GetPage(
    name: HomeView.id,
    page: () => const HomeView(),
  ),
  GetPage(
    name: PopularMoviesView.id,
    page: () => const PopularMoviesView(),
  ),
  GetPage(
    name: TopRatedMoviesView.id,
    page: () => const TopRatedMoviesView(),
  ),
  GetPage(
    name: MovieDetailsView.id,
    page: () => const MovieDetailsView(),
  ),
];
