part of 'movies_upcoming_bloc.dart';

abstract class MoviesUpcomingEvent extends Equatable {
  const MoviesUpcomingEvent();

  @override
  List<Object> get props => [];
}

class GetListMoviesUpcoming extends MoviesUpcomingEvent {
  final int page;
  GetListMoviesUpcoming({this.page});
}
