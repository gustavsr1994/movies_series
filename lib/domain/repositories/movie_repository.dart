import 'package:movies_series/data/datasource/datasource.dart';
import 'package:movies_series/domain/entities/movie/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> listMoviesNowPlaying(int page);
  Future<List<MovieEntity>> listMoviesPopular(int page);
  Future<List<MovieEntity>> listMoviesUpcoming(int page);
  Future<MovieDetailEntity> detailMovies(int idMovie);
  Future<List<MovieReviewEntity>> listReviewMovies(int idMovie, int page);
}

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<MovieDetailEntity> detailMovies(int idMovie) async {
    var data = await DataApi().listDetailMovie(idMovie);

    var listCompanies = <String>[];
    data.productionCompanies.forEach((element) {
      listCompanies.add(element.name);
    });

    var listCountries = <String>[];
    data.productionCountries.forEach((element) {
      listCountries.add(element.name);
    });

    var listGenre = <String>[];
    data.genres.forEach((element) {
      listGenre.add(element.name);
    });
    return MovieDetailEntity(
        adult: data.adult,
        id: data.id,
        content: data.overview,
        status: data.status,
        title: data.originalTitle,
        listProductionCompanies: listCompanies,
        listProductionCountries: listCountries,
        listGenre: listGenre,
        rating: data.voteAverage);
  }

  @override
  Future<List<MovieEntity>> listMoviesNowPlaying(int page) async {
    var result = <MovieEntity>[];
    var data = await DataApi().listMoviesNow(page);
    data.results.forEach((element) {
      result.add(MovieEntity(
          id: element.id,
          imagePoster:
              'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${element.posterPath}',
          title: element.title,
          adult: element.adult,
          content: element.overview,
          popularity: element.popularity,
          rating: element.voteAverage,
          releaseDate: element.releaseDate));
    });
    return result;
  }

  @override
  Future<List<MovieEntity>> listMoviesPopular(int page) async {
    var result = <MovieEntity>[];
    var data = await DataApi().listMoviesPopular(page);
    data.results.forEach((element) {
      result.add(MovieEntity(
          id: element.id,
          imagePoster:
              'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${element.posterPath}',
          title: element.title,
          adult: element.adult,
          content: element.overview,
          popularity: element.popularity,
          rating: element.voteAverage,
          releaseDate: element.releaseDate));
    });
    return result;
  }

  @override
  Future<List<MovieEntity>> listMoviesUpcoming(int page) async {
    var result = <MovieEntity>[];
    var data = await DataApi().listMoviesUpcoming(page);
    data.results.forEach((element) {
      result.add(MovieEntity(
          id: element.id,
          title: element.title,
          imagePoster:
              'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${element.posterPath}',
          adult: element.adult,
          content: element.overview,
          popularity: element.popularity,
          rating: element.voteAverage,
          releaseDate: element.releaseDate));
    });
    return result;
  }

  @override
  Future<List<MovieReviewEntity>> listReviewMovies(
      int idMovie, int page) async {
    var result = <MovieReviewEntity>[];
    var data = await DataApi().listReviewMovie(idMovie, page);
    data.results.forEach((element) {
      result.add(MovieReviewEntity(
          author: element.author,
          content: element.content,
          rating: element.authorDetails.rating,
          url: element.url));
    });
    return result;
  }
}
