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
