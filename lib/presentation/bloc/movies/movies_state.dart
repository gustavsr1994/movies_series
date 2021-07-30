part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final List<MovieEntity> listMovies;
  final MovieDetailEntity detailMovies;
  final List<MovieReviewEntity> listReview;
  final ResultStateApi state;
  final int index;
  const MoviesState(
      {this.listMovies,
      this.detailMovies,
      this.listReview,
      this.state,
      this.index});
  MoviesState copyWith(
      {final List<MovieEntity> listMovies,
      final MovieDetailEntity detailMovies,
      final List<MovieReviewEntity> listReview,
      final ResultStateApi state,
      final int index}) {
    return MoviesState(
        listMovies: listMovies ?? this.listMovies,
        detailMovies: detailMovies ?? this.detailMovies,
        listReview: listReview ?? this.listReview,
        state: state ?? this.state,
        index: index ?? this.index);
  }

  @override
  List<Object> get props => [listMovies, detailMovies, listReview, state];
}
