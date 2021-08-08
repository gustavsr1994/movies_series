part of 'series_bloc.dart';

class SeriesState extends Equatable {
  final List<SeriesEntity> listSeries;
  final SeriesDetailEntity detailSeries;
  final List<SeriesReviewEntity> listReview;
  final ResultStateApi state;
  final int index;
  const SeriesState(
      {this.listSeries,
      this.detailSeries,
      this.listReview,
      this.state,
      this.index});
  SeriesState copyWith(
      {final List<SeriesEntity> listSeries,
      final SeriesDetailEntity detailSeries,
      final List<SeriesReviewEntity> listReview,
      final ResultStateApi state,
      final int index}) {
    return SeriesState(
        listSeries: listSeries ?? this.listSeries,
        detailSeries: detailSeries ?? this.detailSeries,
        listReview: listReview ?? this.listReview,
        state: state ?? this.state,
        index: index ?? this.index);
  }

  @override
  List<Object> get props => [listSeries, detailSeries, listReview, state];
}
