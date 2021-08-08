part of 'movies_upcoming_bloc.dart';

class MoviesUpcomingState extends Equatable {
  final List<MovieEntity> listMovies;
  final ResultStateApi state;
  const MoviesUpcomingState({this.listMovies, this.state});
  MoviesUpcomingState copyWith(
      {final List<MovieEntity> listMovies, final ResultStateApi state}) {
    return MoviesUpcomingState(
        listMovies: listMovies ?? this.listMovies, state: state ?? this.state);
  }

  @override
  List<Object> get props => [listMovies, state];
}
