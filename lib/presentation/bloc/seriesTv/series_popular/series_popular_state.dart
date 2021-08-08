part of 'series_popular_bloc.dart';

class SeriesPopularState extends Equatable {
  final List<SeriesEntity> listSeries;
  final ResultStateApi state;
  const SeriesPopularState({this.listSeries, this.state});
  SeriesPopularState copyWith(
      {final List<SeriesEntity> listSeries, final ResultStateApi state}) {
    return SeriesPopularState(
        listSeries: listSeries ?? this.listSeries, state: state ?? this.state);
  }

  @override
  List<Object> get props => [listSeries, state];
}
