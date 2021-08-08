import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_series/domain/entities/series/series_entity.dart';
import 'package:movies_series/domain/usecase/series_usecase.dart';
import 'package:movies_series/presentation/shared/commons/result_state.dart';
part 'series_event.dart';
part 'series_state.dart';

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {
  SeriesBloc() : super(SeriesState());

  @override
  Stream<SeriesState> mapEventToState(
    SeriesEvent event,
  ) async* {
    if (event is GetListSeriesOnAir) {
      yield* _getListSeriesOnAir(event.page);
    }

    if (event is DetailSeries) {
      yield* _getDetailSeries(event.idMovie);
    }

    if (event is GetListReviewSeries) {
      yield* _getListReviewSeries(event.idMovie, event.page);
    }
  }

  Stream<SeriesState> _getListSeriesOnAir(int page) async* {
    try {
      yield state.copyWith(state: ResultStateApi.Loading);
      var response = await SeriesUsecaseImpl().listSeriesOnAir(page);
      if (response.isEmpty) {
        yield state.copyWith(state: ResultStateApi.NoData);
      } else {
        yield state.copyWith(
            state: ResultStateApi.HasData, listSeries: response, index: 1);
      }
    } on DioError catch (e) {
      yield state.copyWith(state: ResultStateApi.Error);
    }
  }

  Stream<SeriesState> _getDetailSeries(int idMovie) async* {
    try {
      yield state.copyWith(state: ResultStateApi.Loading);
      var response = await SeriesUsecaseImpl().detailSeries(idMovie);
      if (response == null) {
        yield state.copyWith(state: ResultStateApi.NoData);
      } else {
        yield state.copyWith(
            state: ResultStateApi.HasData, detailSeries: response);
      }
    } on DioError catch (e) {
      yield state.copyWith(state: ResultStateApi.Error);
    }
  }

  Stream<SeriesState> _getListReviewSeries(int idMovie, int page) async* {
    try {
      yield state.copyWith(state: ResultStateApi.Loading);
      var response = await SeriesUsecaseImpl().listReviewSeries(idMovie, page);
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
