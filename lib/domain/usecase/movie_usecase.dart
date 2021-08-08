import 'package:movies_series/domain/entities/movie/movie_entity.dart';
import 'package:movies_series/domain/repositories/movie_repository.dart';

abstract class MovieUsecase {
  Future<List<MovieEntity>> listMoviesNowPlaying(int page);
  Future<List<MovieEntity>> listMoviesPopular(int page);
  Future<List<MovieEntity>> listMoviesUpcoming(int page);
  Future<MovieDetailEntity> detailMovies(int idMovie);
  Future<List<MovieReviewEntity>> listReviewMovies(int idMovie, int page);
}

class MovieUsecaseImpl extends MovieUsecase {
  @override
  Future<MovieDetailEntity> detailMovies(int idMovie) =>
      MovieRepositoryImpl().detailMovies(idMovie);

  @override
  Future<List<MovieEntity>> listMoviesNowPlaying(int page) =>
      MovieRepositoryImpl().listMoviesNowPlaying(page);

  @override
  Future<List<MovieEntity>> listMoviesPopular(int page) =>
      MovieRepositoryImpl().listMoviesPopular(page);

  @override
  Future<List<MovieEntity>> listMoviesUpcoming(int page) =>
      MovieRepositoryImpl().listMoviesUpcoming(page);

  @override
  Future<List<MovieReviewEntity>> listReviewMovies(int idMovie, int page) =>
      MovieRepositoryImpl().listReviewMovies(idMovie, page);
}
