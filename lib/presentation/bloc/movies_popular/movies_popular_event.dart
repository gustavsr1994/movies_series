part of 'movies_popular_bloc.dart';

abstract class MoviesPopularEvent extends Equatable {
  const MoviesPopularEvent();

  @override
  List<Object> get props => [];
}

class GetListMoviesPopular extends MoviesPopularEvent {}