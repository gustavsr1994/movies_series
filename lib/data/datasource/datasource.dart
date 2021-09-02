import 'package:movies_series/data/models/movie/detail/movie_detail_response.dart';
import 'package:movies_series/data/models/movie/movie_popular_response.dart';
import 'package:movies_series/data/models/movie/movie_response.dart';
import 'package:dio/dio.dart';
import 'package:movies_series/data/models/movie/review/movie_review_response.dart';

abstract class DataSource {
  Future<MoviesResponse> listMoviesNow(int page);
  Future<MoviesResponse> listMoviesUpcoming(int page);
  Future<MoviesPopularResponse> listMoviesPopular(int page);

  Future<MoviesDetailResponse> listDetailMovie(int idMovie);
  Future<MoviesReviewResponse> listReviewMovie(int idMovie, int page);

}

class DataApi extends DataSource {
  @override
  Future<MoviesResponse> listMoviesNow(int page) async {
    Dio dio = new Dio();
    Response response = await dio.get(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=7be963c975b0ae811ceda3b0755e622a&language=en-US&page=$page');
    return MoviesResponse.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<MoviesPopularResponse> listMoviesPopular(int page) async {
    Dio dio = new Dio();
    Response response = await dio.get(
        'https://api.themoviedb.org/3/movie/popular?api_key=7be963c975b0ae811ceda3b0755e622a&language=en-US&page=$page');
    return MoviesPopularResponse.fromJson(
        response.data as Map<String, dynamic>);
  }

  @override
  Future<MoviesResponse> listMoviesUpcoming(int page) async {
    Dio dio = new Dio();
    Response response = await dio.get(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=7be963c975b0ae811ceda3b0755e622a&language=en-US&page=$page');
    return MoviesResponse.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<MoviesDetailResponse> listDetailMovie(int idMovie) async {
    Dio dio = new Dio();
    Response response = await dio.get(
        'https://api.themoviedb.org/3/movie/$idMovie?api_key=7be963c975b0ae811ceda3b0755e622a&language=en-US');
    return MoviesDetailResponse.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<MoviesReviewResponse> listReviewMovie(int idMovie, int page) async {
    Dio dio = new Dio();
    Response response = await dio.get(
        'https://api.themoviedb.org/3/movie/$idMovie/reviews?api_key=7be963c975b0ae811ceda3b0755e622a&language=en-US&page=$page');
    return MoviesReviewResponse.fromJson(response.data as Map<String, dynamic>);
  }

}
