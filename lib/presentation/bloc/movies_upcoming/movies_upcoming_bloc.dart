import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_series/domain/entities/movie/movie_entity.dart';
import 'package:movies_series/domain/usecase/movie_usecase.dart';
import 'package:movies_series/presentation/shared/commons/result_state.dart';

part 'movies_upcoming_event.dart';
part 'movies_upcoming_state.dart';

class MoviesUpcomingBloc
    extends Bloc<MoviesUpcomingEvent, MoviesUpcomingState> {
  MoviesUpcomingBloc() : super(MoviesUpcomingState());

  @override
  Stream<MoviesUpcomingState> mapEventToState(
    MoviesUpcomingEvent event,
  ) async* {
    if (event is GetListMoviesUpcoming) {
      yield* _getListMoviesUpcoming();
    }
  }

  Stream<MoviesUpcomingState> _getListMoviesUpcoming() async* {
    try {
      yield state.copyWith(state: ResultStateApi.Loading);
      var response = await MovieUsecaseImpl().listMoviesUpcoming();
      if (response.isEmpty) {
        yield state.copyWith(state: ResultStateApi.NoData);
      } else {
        yield state.copyWith(
            state: ResultStateApi.HasData, listMovies: response);
      }
    } on DioError catch (e) {
      yield state.copyWith(state: ResultStateApi.Error);
    }
  }
}
