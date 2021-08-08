import 'package:movies_series/data/datasource/datasource.dart';
import 'package:movies_series/domain/entities/series/series_entity.dart';

abstract class SeriesRepository {
  Future<List<SeriesEntity>> listSeriesOnAir(int page);
  Future<List<SeriesEntity>> listSeriesPopular(int page);
  Future<SeriesDetailEntity> detailSeries(int idSeries);
  Future<List<SeriesReviewEntity>> listReviewSeries(int idSeries, int page);
}

class SeriesRepositoryImpl extends SeriesRepository {
  @override
  Future<SeriesDetailEntity> detailSeries(int idSeries) async {
    var data = await DataApi().listDetailSeries(idSeries);

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

    var listSeason = <SeriesSeasonEntity>[];
    data.seasons.forEach((element) {
      listSeason.add(SeriesSeasonEntity(
          nameSeason: element.name,
          episodes: element.episodeCount,
          airDate: element.airDate));
    });

    return SeriesDetailEntity(
        id: data.id,
        content: data.overview,
        status: data.status,
        title: data.name,
        createdBy: data.createdBy[0].name,
        listProductionCompanies: listCompanies,
        listProductionCountries: listCountries,
        listGenre: listGenre,
        listSeason: listSeason);
  }

  @override
  Future<List<SeriesReviewEntity>> listReviewSeries(
      int idSeries, int page) async {
    var result = <SeriesReviewEntity>[];
    var data = await DataApi().listReviewSeries(idSeries, page);
    data.results.forEach((element) {
      result.add(SeriesReviewEntity(
          author: element.author,
          content: element.content,
          rating: element.authorDetails.rating,
          url: element.url));
    });
    return result;
  }

  @override
  Future<List<SeriesEntity>> listSeriesOnAir(int page) async {
    var result = <SeriesEntity>[];
    var data = await DataApi().listSeriesOnAir(page);
    data.results.forEach((element) {
      result.add(SeriesEntity(
        id: element.id,
        imagePoster:
            'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${element.posterPath}',
        title: element.name,
        content: element.overview,
        popularity: element.popularity.toString(),
        firstOnAirDate: element.firstAirDate,
      ));
    });
    return result;
  }

  @override
  Future<List<SeriesEntity>> listSeriesPopular(int page) async {
    var result = <SeriesEntity>[];
    var data = await DataApi().listSeriesPopular(page);
    data.results.forEach((element) {
      result.add(SeriesEntity(
        id: element.id,
        imagePoster:
            'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${element.posterPath}',
        title: element.name,
        content: element.overview,
        popularity: element.popularity.toString(),
        firstOnAirDate: element.firstAirDate,
      ));
    });
    return result;
  }
}
