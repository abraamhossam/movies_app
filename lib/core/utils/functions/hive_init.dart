import 'package:hive_flutter/adapters.dart';
import 'package:movies_app/Features/home/domain/entites/movie_entity.dart';
import 'package:movies_app/constants.dart';

Future<void> hiveInit() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MovieEntityAdapter());
  await Hive.openBox<MovieEntity>(kNowPlayingMoviesBox);
  await Hive.openBox<MovieEntity>(kPopularMoviesBox);
  await Hive.openBox<MovieEntity>(kTopRatedMoviewsBox);
}
