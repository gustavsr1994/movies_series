import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_series/domain/entities/movie/movie_entity.dart';
import 'package:movies_series/domain/usecase/movie_usecase.dart';
import 'package:movies_series/presentation/shared/commons/result_state.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesState());

  @override
  Stream<MoviesState> mapEventToState(
    MoviesEvent event,
  ) async* {
    if (event is GetListMoviesNowPlaying) {
      yield* _getListMoviesNowPlaying(event.page);
    }
    
    if (event is DetailMovies) {
      yield* _getDetailMovies(event.idMovie);
    }

    if (event is GetListReviewMovies) {
      yield* _getListReviewMovies(event.idMovie, event.page);
    }
  }

  Stream<MoviesState> _getListMoviesNowPlaying(int page) async* {
    try {
      yield state.copyWith(state: ResultStateApi.Loading);
      var response = await MovieUsecaseImpl().listMoviesNowPlaying(page);
      if (response.isEmpty) {
        yield state.copyWith(state: ResultStateApi.NoData);
      } else {
        yield state.copyWith(state: ResultStateApi.HasData, listMovies: response, index: 1);
      }
    } on DioError catch (e) {
      yield state.copyWith(state: ResultStateApi.Error);
    }
  }

  Stream<MoviesState> _getDetailMovies(int idMovie) async* {
    try {
      yield state.copyWith(state: ResultStateApi.Loading);
      var response = await MovieUsecaseImpl().detailMovies(idMovie);
      if (response == null) {
        yield state.copyWith(state: ResultStateApi.NoData);
      } else {
        yield state.copyWith(state: ResultStateApi.HasData, detailMovies: response);
      }
    } on DioError catch (e) {
      yield state.copyWith(state: ResultStateApi.Error);
    }
  }

  Stream<MoviesState> _getListReviewMovies(int idMovie, int page) async* {
    try {
      yield state.copyWith(state: ResultStateApi.Loading);
      var response = await MovieUsecaseImpl().listReviewMovies(idMovie, page);
      if (response.isEmpty) {
        yield state.copyWith(state: ResultStateApi.NoData);
      } else {
        yield state.copyWith(listReview: response);
      }
    } on DioError catch (e) {
      yield state.copyWith(state: ResultStateApi.Error);
    }
  }
}
