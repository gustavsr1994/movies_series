part of 'detail_movie_bloc.dart';

class DetailMovieState extends Equatable {
  final MovieDetailEntity detailMovies;
  final List<MovieReviewEntity> listReview;
  final ResultStateApi state;
  final int index;
  const DetailMovieState(
      {
      this.detailMovies,
      this.listReview,
      this.state,
      this.index});
  DetailMovieState copyWith(
      {
      final MovieDetailEntity detailMovies,
      final List<MovieReviewEntity> listReview,
      final ResultStateApi state,
      final int index}) {
    return DetailMovieState(
        detailMovies: detailMovies ?? this.detailMovies,
        listReview: listReview ?? this.listReview,
        state: state ?? this.state,
        index: index ?? this.index);
  }

  @override
  List<Object> get props => [detailMovies, listReview, state];
}
