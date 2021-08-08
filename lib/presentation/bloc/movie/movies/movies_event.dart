part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class GetListMoviesNowPlaying extends MoviesEvent {
  final int page;
  GetListMoviesNowPlaying({this.page});
}

class DetailMovies extends MoviesEvent {
  final int idMovie;
  DetailMovies({this.idMovie});
}

class GetListReviewMovies extends MoviesEvent {
  final int idMovie;
  final int page;
  GetListReviewMovies({this.idMovie, this.page});
}
