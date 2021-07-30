import 'package:movies_series/data/models/movie/detail/movie_detail_response.dart';
import 'package:movies_series/data/models/movie/movie_popular_response.dart';
import 'package:movies_series/data/models/movie/movie_response.dart';
import 'package:dio/dio.dart';
import 'package:movies_series/data/models/movie/review/movie_review_response.dart';
import 'package:movies_series/data/models/series/detail/series_detail_response.dart';
import 'package:movies_series/data/models/series/review/series_review_response.dart';
import 'package:movies_series/data/models/series/series_response.dart';

abstract class DataSource {
  Future<MoviesResponse> listMoviesNow();
  Future<MoviesResponse> listMoviesUpcoming();
  Future<MoviesPopularResponse> listMoviesPopular();

  Future<MoviesDetailResponse> listDetailMovie(int idMovie);
  Future<MoviesReviewResponse> listReviewMovie(int idMovie);

  Future<SeriesResponse> listSeriesOnAir();
  Future<SeriesResponse> listSeriesPopular();

  Future<SeriesDetailResponse> listDetailSeries(int idSeries);
  Future<SeriesReviewResponse> listReviewSeries(int idSeries);
}

class DataApi extends DataSource {
  @override
  Future<MoviesResponse> listMoviesNow() async {
    Dio dio = new Dio();
    Response response = await dio.get(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=7be963c975b0ae811ceda3b0755e622a&language=en-US&page=1');
    return MoviesResponse.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<MoviesPopularResponse> listMoviesPopular() async {
    Dio dio = new Dio();
    Response response = await dio.get(
        'https://api.themoviedb.org/3/movie/popular?api_key=7be963c975b0ae811ceda3b0755e622a&language=en-US&page=1');
    return MoviesPopularResponse.fromJson(
        response.data as Map<String, dynamic>);
  }

  @override
  Future<MoviesResponse> listMoviesUpcoming() async {
    Dio dio = new Dio();
    Response response = await dio.get(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=7be963c975b0ae811ceda3b0755e622a&language=en-US&page=1');
    return MoviesResponse.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<SeriesResponse> listSeriesOnAir() async {
    Dio dio = new Dio();
    Response response = await dio.get(
        'https://api.themoviedb.org/3/tv/on_the_air?api_key=7be963c975b0ae811ceda3b0755e622a&language=en-US&page=1');
    return SeriesResponse.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<SeriesResponse> listSeriesPopular() async {
    Dio dio = new Dio();
    Response response = await dio.get(
        'https://api.themoviedb.org/3/tv/popular?api_key=7be963c975b0ae811ceda3b0755e622a&language=en-US&page=1');
    return SeriesResponse.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<MoviesDetailResponse> listDetailMovie(int idMovie) async {
    Dio dio = new Dio();
    Response response = await dio.get(
        'https://api.themoviedb.org/3/movie/$idMovie?api_key=7be963c975b0ae811ceda3b0755e622a&language=en-US');
    return MoviesDetailResponse.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<MoviesReviewResponse> listReviewMovie(int idMovie) async {
    Dio dio = new Dio();
    Response response = await dio.get(
        'https://api.themoviedb.org/3/movie/$idMovie/reviews?api_key=7be963c975b0ae811ceda3b0755e622a&language=en-US&page=1');
    return MoviesReviewResponse.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<SeriesDetailResponse> listDetailSeries(int idSeries) async {
    Dio dio = new Dio();
    Response response = await dio.get(
        'https://api.themoviedb.org/3/tv/$idSeries?api_key=7be963c975b0ae811ceda3b0755e622a&language=en-US');
    return SeriesDetailResponse.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<SeriesReviewResponse> listReviewSeries(int idSeries) async {
    Dio dio = new Dio();
    Response response = await dio.get(
        'https://api.themoviedb.org/3/tv/$idSeries/reviews?api_key=7be963c975b0ae811ceda3b0755e622a&language=en-US&page=1');
    return SeriesReviewResponse.fromJson(response.data as Map<String, dynamic>);
  }
}
