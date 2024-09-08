import 'dart:core';
import 'package:hive/hive.dart';
import 'package:movies_app/Features/home/data/models/movie_details_model/movie_details_model.dart';
import 'package:movies_app/Features/home/data/models/movie_model.dart';
import 'package:movies_app/Features/home/domain/entites/movie_details_entity.dart';
import 'package:movies_app/Features/home/domain/entites/movie_entity.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/core/utils/api_service.dart';

abstract class HomeRemoteDataSource {
  Future<List<MovieEntity>> fetchNowPlayingMovies();
  Future<List<MovieEntity>> fetchPopularMovies({int pageNumber = 1});
  Future<List<MovieEntity>> fetchTopRatedMovies({int pageNumber = 1});
  Future<MovieDetailsEntity> fetchMovieDetails({required num movieId});
  Future<List<MovieEntity>> fetchRecommendedMovies({required num movieId});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  String apiKey = "c3435cfe40aeb079689227d82bf921d3";

  HomeRemoteDataSourceImpl({
    required this.apiService,
  });
  @override
  Future<List<MovieEntity>> fetchNowPlayingMovies() async {
    List<MovieEntity> movies = [];
    Map<String, dynamic> data = await apiService.get(
      endPoint: "movie/now_playing?api_key=$apiKey",
    );
    for (var item in data["results"]) {
      movies.add(
        MovieModel.fromJson(item),
      );
    }
    var box = Hive.box<MovieEntity>(kNowPlayingMoviesBox);
    box.addAll(movies);
    return movies;
  }

  @override
  Future<List<MovieEntity>> fetchPopularMovies({int pageNumber = 1}) async {
    List<MovieEntity> movies = [];
    Map<String, dynamic> data = await apiService.get(
      endPoint: "movie/popular?api_key=$apiKey&page=$pageNumber",
    );
    for (var item in data["results"]) {
      movies.add(
        MovieModel.fromJson(item),
      );
    }
    var box = Hive.box<MovieEntity>(kPopularMoviesBox);
    box.addAll(movies);
    return movies;
  }

  @override
  Future<List<MovieEntity>> fetchTopRatedMovies({int pageNumber = 1}) async {
    List<MovieEntity> movies = [];
    Map<String, dynamic> data = await apiService.get(
      endPoint: "movie/top_rated?api_key=$apiKey&page=$pageNumber",
    );
    for (var item in data["results"]) {
      movies.add(
        MovieModel.fromJson(item),
      );
    }
    var box = Hive.box<MovieEntity>(kTopRatedMoviewsBox);
    box.addAll(movies);
    return movies;
  }

  @override
  Future<MovieDetailsEntity> fetchMovieDetails({required num movieId}) async {
    Map<String, dynamic> data = await apiService.get(
      endPoint: "movie/$movieId?api_key=$apiKey",
    );
    return MovieDetailsModel.fromJson(data);
  }

  @override
  Future<List<MovieEntity>> fetchRecommendedMovies(
      {required num movieId}) async {
    List<MovieEntity> movies = [];
    Map<String, dynamic> data = await apiService.get(
      endPoint: "movie/$movieId/recommendations?api_key=$apiKey",
    );
    for (var item in data["results"]) {
      movies.add(
        MovieModel.fromJson(item),
      );
    }
    return movies;
  }
}
