import 'package:hive/hive.dart';
import 'package:movies_app/Features/home/domain/entites/movie_entity.dart';
import 'package:movies_app/constants.dart';

abstract class HomeLocalDataSource {
  List<MovieEntity> fetchNowPlayingMovies({int pageNumber = 1});
  List<MovieEntity> fetchPopularMovies({int pageNumber = 1});
  List<MovieEntity> fetchTopRatedMovies({int pageNumber = 1});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<MovieEntity> fetchNowPlayingMovies({int pageNumber = 1}) {
    var box = Hive.box<MovieEntity>(kNowPlayingMoviesBox);

    return box.values.toList();
  }

  @override
  List<MovieEntity> fetchPopularMovies({int pageNumber = 1}) {
    int startIndex = 20 * (pageNumber - 1);
    int endIndex = (20 * (pageNumber - 1)) + 19;
    var box = Hive.box<MovieEntity>(kPopularMoviesBox);
    var length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<MovieEntity> fetchTopRatedMovies({int pageNumber = 1}) {
    int startIndex = 20 * (pageNumber - 1);
    int endIndex = (20 * (pageNumber - 1)) + 19;
    var box = Hive.box<MovieEntity>(kTopRatedMoviewsBox);
    var length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}
