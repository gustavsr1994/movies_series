part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class GetListMoviesNowPlaying extends MoviesEvent {}

class DetailMovies extends MoviesEvent {
  final int idMovie;
  DetailMovies({this.idMovie});
}

class GetListReviewMovies extends MoviesEvent {
  final int idMovie;
  GetListReviewMovies({this.idMovie});
}
