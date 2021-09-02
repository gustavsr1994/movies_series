import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_series/presentation/bloc/detail/detail_movie_bloc.dart';
import 'package:movies_series/presentation/shared/commons/result_state.dart';
import 'package:movies_series/presentation/shared/style/colors_pallete.dart';
import 'package:movies_series/presentation/shared/style/text_style_custom.dart';

class DetailMovieScreen extends StatefulWidget {
  @override
  _DetailMovieScreenState createState() => _DetailMovieScreenState();
  final int index;
  DetailMovieScreen({this.index});
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
  String titleMovie = '';
  @override
  void initState() {
    super.initState();
    context.read<DetailMovieBloc>().add(DetailMovies(idMovie: widget.index));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DetailMovieBloc, DetailMovieState>(
      listener: (context, state) {
        if (state.state == ResultStateApi.HasData) {
          setState(() {
            titleMovie = state.detailMovies.title;
          });
        }
      },
      child: Scaffold(
        backgroundColor: mainColor,
        appBar: AppBar(
            leading: BackButton(
              color: accentColor,
            ),
            title: Text(
              titleMovie,
              style: textLargerColor(boldCondition: true, color: accentColor),
            )),
        body: BlocBuilder<DetailMovieBloc, DetailMovieState>(
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
                                          boldCondition: false,
                                          color: mainColor),
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
                                          boldCondition: false,
                                          color: mainColor),
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
                                          boldCondition: false,
                                          color: mainColor),
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
                        'Reviews',
                        style: textMediumColor(
                            boldCondition: true, color: accentColor),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var index = 0;
                              index < state.listReview.length;
                              index++)
                            Container(
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.all(8),
                              width:
                                  (MediaQuery.of(context).size.width / 2) + 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.amber),
                                color: Colors.black,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.listReview[index].author,
                                    style: textLargerColor(
                                        boldCondition: true,
                                        color: accentColor),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    state.listReview[index].content,
                                    overflow: TextOverflow.ellipsis,
                                    style: textMediumColor(
                                        boldCondition: false,
                                        color: accentColor),
                                  ),
                                ],
                              ),
                            )
                        ],
                      ),
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
      ),
    );
  }
}
