import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_series/domain/entities/movie/movie_entity.dart';
import 'package:movies_series/domain/usecase/movie_usecase.dart';
import 'package:movies_series/presentation/shared/commons/result_state.dart';

part 'detail_movie_event.dart';
part 'detail_movie_state.dart';

class DetailMovieBloc extends Bloc<DetailMovieEvent, DetailMovieState> {
  DetailMovieBloc() : super(DetailMovieState());

  @override
  Stream<DetailMovieState> mapEventToState(
    DetailMovieEvent event,
  ) async* {
    
    if (event is DetailMovies) {
      yield* _getDetailMovies(event.idMovie);
    }
  }

   Stream<DetailMovieState> _getDetailMovies(int idMovie) async* {
    try {
      yield state.copyWith(state: ResultStateApi.Loading);
      var response = await MovieUsecaseImpl().detailMovies(idMovie);
      if (response == null) {
        yield state.copyWith(state: ResultStateApi.NoData);
      } else {
        yield* _getListReviewMovies(idMovie, 1, response);
        // yield state.copyWith(state: ResultStateApi.HasData, detailMovies: response);
      }
    } on DioError catch (e) {
      yield state.copyWith(state: ResultStateApi.Error);
    }
  }

  Stream<DetailMovieState> _getListReviewMovies(int idMovie, int page, MovieDetailEntity detailMovie) async* {
    try {
      yield state.copyWith(state: ResultStateApi.Loading);
      var response = await MovieUsecaseImpl().listReviewMovies(idMovie, page);
      if (response.isEmpty) {
        yield state.copyWith(state: ResultStateApi.NoData);
      } else {
        yield state.copyWith(state: ResultStateApi.HasData, listReview: response, detailMovies: detailMovie);
      }
    } on DioError catch (e) {
      yield state.copyWith(state: ResultStateApi.Error);
    }
  }
}
