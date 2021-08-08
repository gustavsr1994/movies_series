import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_series/domain/entities/series/series_entity.dart';
import 'package:movies_series/domain/usecase/series_usecase.dart';
import 'package:movies_series/presentation/shared/commons/result_state.dart';

part 'series_popular_event.dart';
part 'series_popular_state.dart';

class SeriesPopularBloc extends Bloc<SeriesPopularEvent, SeriesPopularState> {
  SeriesPopularBloc() : super(SeriesPopularState());

  @override
  Stream<SeriesPopularState> mapEventToState(
    SeriesPopularEvent event,
  ) async* {
    if (event is GetListSeriesPopular) {
      yield* _getListSeriesPopular(event.page);
    }
  }

  Stream<SeriesPopularState> _getListSeriesPopular(int page) async* {
    try {
      yield state.copyWith(state: ResultStateApi.Loading);
      var response = await SeriesUsecaseImpl().listSeriesPopular(page);
      if (response.isEmpty) {
        yield state.copyWith(state: ResultStateApi.NoData);
      } else {
        yield state.copyWith(
            state: ResultStateApi.HasData, listSeries: response);
      }
    } on DioError catch (e) {
      yield state.copyWith(state: ResultStateApi.Error);
    }
  }
}
