part of 'detail_movie_bloc.dart';

abstract class DetailMovieEvent extends Equatable {
  const DetailMovieEvent();

  @override
  List<Object> get props => [];
}


class DetailMovies extends DetailMovieEvent {
  final int idMovie;
  DetailMovies({this.idMovie});
}
