import 'package:movies_series/domain/entities/movie/movie_entity.dart';
import 'package:movies_series/domain/repositories/movie_repository.dart';

abstract class MovieUsecase {
  Future<List<MovieEntity>> listMoviesNowPlaying();
  Future<List<MovieEntity>> listMoviesPopular();
  Future<List<MovieEntity>> listMoviesUpcoming();
  Future<MovieDetailEntity> detailMovies(int idMovie);
  Future<List<MovieReviewEntity>> listReviewMovies(int idMovie);
}

class MovieUsecaseImpl extends MovieUsecase {
  @override
  Future<MovieDetailEntity> detailMovies(int idMovie) =>
      MovieRepositoryImpl().detailMovies(idMovie);

  @override
  Future<List<MovieEntity>> listMoviesNowPlaying() =>
      MovieRepositoryImpl().listMoviesNowPlaying();

  @override
  Future<List<MovieEntity>> listMoviesPopular() =>
      MovieRepositoryImpl().listMoviesPopular();

  @override
  Future<List<MovieEntity>> listMoviesUpcoming() =>
      MovieRepositoryImpl().listMoviesUpcoming();

  @override
  Future<List<MovieReviewEntity>> listReviewMovies(int idMovie) =>
      MovieRepositoryImpl().listReviewMovies(idMovie);
}
