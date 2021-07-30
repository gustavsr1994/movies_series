import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_series/domain/entities/movie/movie_entity.dart';
import 'package:movies_series/domain/usecase/movie_usecase.dart';
import 'package:movies_series/presentation/shared/commons/result_state.dart';

part 'movies_popular_event.dart';
part 'movies_popular_state.dart';

class MoviesPopularBloc extends Bloc<MoviesPopularEvent, MoviesPopularState> {
  MoviesPopularBloc() : super(MoviesPopularState());

  @override
  Stream<MoviesPopularState> mapEventToState(
    MoviesPopularEvent event,
  ) async* {
    if (event is GetListMoviesPopular) {
      yield* _getListMoviesPopular();
    }
  }

  Stream<MoviesPopularState> _getListMoviesPopular() async* {
    try {
      yield state.copyWith(state: ResultStateApi.Loading);
      var response = await MovieUsecaseImpl().listMoviesPopular();
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
