part of 'movies_popular_bloc.dart';

class MoviesPopularState extends Equatable {
  final List<MovieEntity> listMovies;
  final ResultStateApi state;
  const MoviesPopularState({this.listMovies, this.state});
  MoviesPopularState copyWith(
      {final List<MovieEntity> listMovies, final ResultStateApi state}) {
    return MoviesPopularState(
        listMovies: listMovies ?? this.listMovies, state: state ?? this.state);
  }

  @override
  List<Object> get props => [listMovies, state];
}
