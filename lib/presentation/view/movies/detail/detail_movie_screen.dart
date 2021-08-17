import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_series/presentation/bloc/movie/movies/movies_bloc.dart';
import 'package:movies_series/presentation/shared/commons/result_state.dart';
import 'package:movies_series/presentation/shared/style/colors_pallete.dart';
import 'package:movies_series/presentation/shared/style/text_style_custom.dart';

class DetailMovieScreen extends StatefulWidget {
  @override
  _DetailMovieScreenState createState() => _DetailMovieScreenState();
  static const routeName = '/detailMovieScreen';
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    final indexData = ModalRoute.of(context).settings.arguments as int;
    index = indexData;
    context.read<MoviesBloc>().add(DetailMovies(idMovie: index));
    context.read<MoviesBloc>().add(GetListReviewMovies(idMovie: index, page: 1));

    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(title: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state.state == ResultStateApi.HasData) {
            return Text(state.detailMovies.title,
                style:
                    textLargerColor(boldCondition: true, color: accentColor));
          } else {
            return SizedBox();
          }
        },
      )),
      body: BlocBuilder<MoviesBloc, MoviesState>(
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
                      state.detailMovies.content,
                      textAlign: TextAlign.justify,
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
                            index < state.detailMovies.listGenre.length;
                            index++)
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Chip(
                                backgroundColor: accentColor,
                                label: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    state.detailMovies.listGenre[index],
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
                                state.detailMovies.listProductionCompanies
                                    .length;
                            index++)
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Chip(
                                backgroundColor: accentColor,
                                label: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    state.detailMovies
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
                                state.detailMovies.listProductionCountries
                                    .length;
                            index++)
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Chip(
                                backgroundColor: accentColor,
                                label: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    state.detailMovies
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
                  BlocBuilder<MoviesBloc, MoviesState>(
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
