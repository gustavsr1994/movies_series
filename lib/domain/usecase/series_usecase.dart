import 'package:movies_series/domain/entities/series/series_entity.dart';
import 'package:movies_series/domain/repositories/series_repository.dart';

abstract class SeriesUsecase {
  Future<List<SeriesEntity>> listSeriesOnAir(int page);
  Future<List<SeriesEntity>> listSeriesPopular(int page);
  Future<SeriesDetailEntity> detailSeries(int idSeries);
  Future<List<SeriesReviewEntity>> listReviewSeries(int idSeries, int page);
}

class SeriesUsecaseImpl extends SeriesUsecase {
  @override
  Future<SeriesDetailEntity> detailSeries(int idSeries) =>
      SeriesRepositoryImpl().detailSeries(idSeries);

  @override
  Future<List<SeriesReviewEntity>> listReviewSeries(int idSeries, int page) =>
      SeriesRepositoryImpl().listReviewSeries(idSeries, page);

  @override
  Future<List<SeriesEntity>> listSeriesOnAir(int page) =>
      SeriesRepositoryImpl().listSeriesOnAir(page);

  @override
  Future<List<SeriesEntity>> listSeriesPopular(int page) =>
      SeriesRepositoryImpl().listSeriesPopular(page);
}
