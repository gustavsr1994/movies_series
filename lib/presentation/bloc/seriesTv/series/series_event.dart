part of 'series_bloc.dart';

abstract class SeriesEvent extends Equatable {
  const SeriesEvent();

  @override
  List<Object> get props => [];
}

class GetListSeriesOnAir extends SeriesEvent {
  final int page;
  GetListSeriesOnAir({this.page});
}

class DetailSeries extends SeriesEvent {
  final int idMovie;
  DetailSeries({this.idMovie});
}

class GetListReviewSeries extends SeriesEvent {
  final int idMovie;
  final int page;
  GetListReviewSeries({this.idMovie, this.page});
}
