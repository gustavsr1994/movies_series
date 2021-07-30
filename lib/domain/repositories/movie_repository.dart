import 'package:movies_series/data/datasource/datasource.dart';
import 'package:movies_series/domain/entities/movie/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> listMoviesNowPlaying();
  Future<List<MovieEntity>> listMoviesPopular();
  Future<List<MovieEntity>> listMoviesUpcoming();
  Future<MovieDetailEntity> detailMovies(int idMovie);
  Future<List<MovieReviewEntity>> listReviewMovies(int idMovie);
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
        listGenre: listGenre);
  }

  @override
  Future<List<MovieEntity>> listMoviesNowPlaying() async {
    var result = <MovieEntity>[];
    var data = await DataApi().listMoviesNow();
    data.results.forEach((element) {
      result.add(MovieEntity(
          id: element.id,
          title: element.title,
          adult: element.adult,
          content: element.overview,
          popularity: element.popularity.toString(),
          releaseDate: element.releaseDate));
    });
    return result;
  }

  @override
  Future<List<MovieEntity>> listMoviesPopular() async {
    var result = <MovieEntity>[];
    var data = await DataApi().listMoviesPopular();
    data.results.forEach((element) {
      result.add(MovieEntity(
          id: element.id,
          title: element.title,
          adult: element.adult,
          content: element.overview,
          popularity: element.popularity.toString(),
          releaseDate: element.releaseDate));
    });
    return result;
  }

  @override
  Future<List<MovieEntity>> listMoviesUpcoming() async {
    var result = <MovieEntity>[];
    var data = await DataApi().listMoviesUpcoming();
    data.results.forEach((element) {
      result.add(MovieEntity(
          id: element.id,
          title: element.title,
          adult: element.adult,
          content: element.overview,
          popularity: element.popularity.toString(),
          releaseDate: element.releaseDate));
    });
    return result;
  }

  @override
  Future<List<MovieReviewEntity>> listReviewMovies(int idMovie) async {
    var result = <MovieReviewEntity>[];
    var data = await DataApi().listReviewMovie(idMovie);
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
