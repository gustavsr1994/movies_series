import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_series/presentation/bloc/seriesTv/series/series_bloc.dart';
import 'package:movies_series/presentation/shared/commons/result_state.dart';
import 'package:movies_series/presentation/shared/style/colors_pallete.dart';
import 'package:movies_series/presentation/shared/style/text_style_custom.dart';

class DetailSeriesScreen extends StatefulWidget {
  @override
  _DetailSeriesScreenState createState() => _DetailSeriesScreenState();
  static const routeName = '/detailSerieScreen';
}

class _DetailSeriesScreenState extends State<DetailSeriesScreen> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    final indexData = ModalRoute.of(context).settings.arguments as int;
    index = indexData;
    context.read<SeriesBloc>().add(DetailSeries(idMovie: index));
    context
        .read<SeriesBloc>()
        .add(GetListReviewSeries(idMovie: index, page: 1));

    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(title: BlocBuilder<SeriesBloc, SeriesState>(
        builder: (context, state) {
          if (state.state == ResultStateApi.HasData) {
            return Text(state.detailSeries.title,
                style:
                    textLargerColor(boldCondition: true, color: accentColor));
          } else {
            return SizedBox();
          }
        },
      )),
      body: BlocBuilder<SeriesBloc, SeriesState>(
        builder: (context, state) {
          if (state.state == ResultStateApi.Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.state == ResultStateApi.HasData) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Text(
                      state.detailSeries.content,
                      textAlign: TextAlign.justify,
                      style: textMediumColor(
                          boldCondition: false, color: accentColor),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Created by : ${state.detailSeries.createdBy}',
                      style: textMediumColor(
                          boldCondition: false, color: accentColor),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Genre',
                      style: textMediumColor(
                          boldCondition: true, color: accentColor),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (var index = 0;
                            index < state.detailSeries.listGenre.length;
                            index++)
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Chip(
                                backgroundColor: accentColor,
                                label: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    state.detailSeries.listGenre[index],
                                    style: textMediumColor(
                                        boldCondition: false, color: mainColor),
                                  ),
                                )),
                          )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Companies',
                      style: textMediumColor(
                          boldCondition: true, color: accentColor),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        for (var index = 0;
                            index <
                                state.detailSeries.listProductionCompanies
                                    .length;
                            index++)
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Chip(
                                backgroundColor: accentColor,
                                label: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    state.detailSeries
                                        .listProductionCompanies[index],
                                    style: textMediumColor(
                                        boldCondition: false, color: mainColor),
                                  ),
                                )),
                          )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Countries',
                      style: textMediumColor(
                          boldCondition: true, color: accentColor),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        for (var index = 0;
                            index <
                                state.detailSeries.listProductionCountries
                                    .length;
                            index++)
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Chip(
                                backgroundColor: accentColor,
                                label: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    state.detailSeries
                                        .listProductionCountries[index],
                                    style: textMediumColor(
                                        boldCondition: false, color: mainColor),
                                  ),
                                )),
                          )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  BlocBuilder<SeriesBloc, SeriesState>(
                    builder: (context, state) {
                      if (state.state == ResultStateApi.HasData) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              for (var index = 0;
                                  index < state.listReview.length;
                                  index++)
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.listReview[index].author,
                                        style: textLargerColor(
                                            boldCondition: true,
                                            color: accentColor),
                                      ),
                                      Text(
                                        state.listReview[index].content,
                                        style: textMediumColor(
                                            boldCondition: false,
                                            color: accentColor),
                                      ),
                                    ],
                                  ),
                                )
                            ],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('Error'));
          }
        },
      ),
    );
  }
}
