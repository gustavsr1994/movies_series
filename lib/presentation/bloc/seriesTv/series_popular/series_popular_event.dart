part of 'series_popular_bloc.dart';

abstract class SeriesPopularEvent extends Equatable {
  const SeriesPopularEvent();

  @override
  List<Object> get props => [];
}

class GetListSeriesPopular extends SeriesPopularEvent {
  final int page;
  GetListSeriesPopular({this.page});
}