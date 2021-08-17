import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_series/presentation/bloc/seriesTv/series/series_bloc.dart';
import 'package:movies_series/presentation/bloc/seriesTv/series_popular/series_popular_bloc.dart';
import 'package:movies_series/presentation/shared/commons/result_state.dart';
import 'package:movies_series/presentation/shared/commons/widgets/card/card_list_title.dart';
import 'package:movies_series/presentation/shared/style/colors_pallete.dart';
import 'package:movies_series/presentation/shared/style/text_style_custom.dart';

class SeriesScreen extends StatefulWidget {
  @override
  _SeriesScreenState createState() => _SeriesScreenState();
}

class _SeriesScreenState extends State<SeriesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SeriesBloc>().add(GetListSeriesOnAir(page: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text('Series On Air',
                            style: textLargerColor(
                                boldCondition: true, color: accentColor)),
                      ),
                      InkWell(
                        child: Text(
                          'View All',
                          style: textMediumColor(
                              boldCondition: true, color: accentColor),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 6),
                  BlocBuilder<SeriesBloc, SeriesState>(
                    builder: (context, state) {
                      if (state.state == ResultStateApi.Loading) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            height: 260,
                            child: Center(child: CircularProgressIndicator()));
                      } else if (state.state == ResultStateApi.HasData) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (var index = 0;
                                  index < state.listSeries.length;
                                  index++)
                                CardListTitle(
                                    title: state.listSeries[index].title,
                                    adult: false,
                                    imagePoster:
                                        state.listSeries[index].imagePoster,
                                    releaseDate:
                                        state.listSeries[index].firstOnAirDate,
                                    popularity:
                                        state.listSeries[index].popularity,
                                    content: state.listSeries[index].content,
                                    onPressed: null)
                            ],
                          ),
                        );
                      } else {
                        return Center(child: Text('Error'));
                      }
                    },
                  ),
                ],
              )),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text('Series Popular',
                            style: textLargerColor(
                                boldCondition: true, color: accentColor)),
                      ),
                      InkWell(
                        child: Text(
                          'View All',
                          style: textMediumColor(
                              boldCondition: true, color: accentColor),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 6),
                  BlocBuilder<SeriesPopularBloc, SeriesPopularState>(
                    builder: (context, state) {
                      if (state.state == ResultStateApi.Loading) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            height: 260,
                            child: Center(child: CircularProgressIndicator()));
                      } else if (state.state == ResultStateApi.HasData) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (var index = 0;
                                  index < state.listSeries.length;
                                  index++)
                                CardListTitle(
                                    title: state.listSeries[index].title,
                                    adult: false,
                                    imagePoster:
                                        state.listSeries[index].imagePoster,
                                    releaseDate:
                                        state.listSeries[index].firstOnAirDate,
                                    popularity:
                                        state.listSeries[index].popularity,
                                    content: state.listSeries[index].content,
                                    onPressed: null)
                            ],
                          ),
                        );
                      } else {
                        return Center(child: Text('Error'));
                      }
                    },
                  ),
                ],
              )),
        ],
      )),
    );
  }
}
