import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:movies_series/presentation/bloc/detail/detail_movie_bloc.dart';
import 'package:movies_series/presentation/shared/commons/result_state.dart';
import 'package:movies_series/presentation/shared/style/colors_pallete.dart';
import 'package:movies_series/presentation/shared/style/text_style_custom.dart';
import 'package:shimmer/shimmer.dart';

class DetailMovieScreen extends StatefulWidget {
  @override
  _DetailMovieScreenState createState() => _DetailMovieScreenState();
  final int index;
  final String image;
  DetailMovieScreen({this.index, this.image});
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
            title: BlocBuilder<DetailMovieBloc, DetailMovieState>(
              builder: (context, state) {
                if (state.state == ResultStateApi.HasData) {
                  return Text(
                    titleMovie,
                    style: textLargerColor(
                        boldCondition: true, color: accentColor),
                  );
                } else {
                  return Shimmer.fromColors(
                      child: Container(
                        height: 30,
                        width: 100,
                      ),
                      baseColor: accentColor.withOpacity(.3),
                      highlightColor: accentSecondColor.withOpacity(.3));
                }
              },
            )),
        body: BlocBuilder<DetailMovieBloc, DetailMovieState>(
          builder: (context, state) {
            if (state.state == ResultStateApi.Loading) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    for (var i = 0; i < 4; i++)
                      Shimmer.fromColors(
                          child: Container(
                            height: MediaQuery.of(context).size.width / 3,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                          ),
                          baseColor: accentColor.withOpacity(.3),
                          highlightColor: accentSecondColor.withOpacity(.3)),
                  ],
                ),
              );
            } else if (state.state == ResultStateApi.HasData) {
              return ListView(
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      padding: EdgeInsets.all(2),
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                          color: accentColor,
                          border: Border.all(color: accentColor),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: CachedNetworkImage(
                        imageUrl: widget.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                          border: Border.all(color: accentColor),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: ListView(
                        children: [
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
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'About',
                              style: textMediumColor(
                                  boldCondition: true, color: accentColor),
                            ),
                          ),
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
                                'Reviews',
                                style: textMediumColor(
                                    boldCondition: true, color: accentColor),
                              ),
                            ),
                            state.listReview.length == 0
                                ? Center(
                                    child: Text(
                                      'No Review',
                                      style: textMediumColor(
                                          boldCondition: false,
                                          color: accentColor),
                                    ),
                                  )
                                : SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        for (var index = 0;
                                            index < state.listReview.length;
                                            index++)
                                          Container(
                                            padding: EdgeInsets.all(8),
                                            margin: EdgeInsets.all(8),
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2) +
                                                100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border:
                                                  Border.all(color: Colors.amber),
                                              color: Colors.black,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  state.listReview[index].content,
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 3,
                                                  style: textLargerColor(
                                                      boldCondition: false,
                                                      color: accentColor),
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                Text(
                                                  "By " +
                                                      state.listReview[index]
                                                          .author,
                                                  style: textMediumColor(
                                                      boldCondition: true,
                                                      color: accentColor),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        primary: accentColor,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius
                                                                        .circular(
                                                                            7))),
                                                        fixedSize: Size(
                                                            MediaQuery.of(context)
                                                                .size
                                                                .width,
                                                            0)),
                                                    onPressed: () {
                                                      showAlertReview(
                                                          context,
                                                          state.listReview[index]
                                                              .author,
                                                          state.listReview[index]
                                                              .content);
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "View Detail",
                                                          style: textMediumColor(
                                                              boldCondition: true,
                                                              color: mainColor),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .arrow_forward_ios_rounded,
                                                          color: mainColor,
                                                        )
                                                      ],
                                                    ))
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
                      )),
                ],
              );
            } else {
              return Center(child: Text('Error'));
            }
          },
        ),
      ),
    );
  }

  void showAlertReview(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            scrollable: true,
            backgroundColor: mainColor,
            title: Text(
              'By : $title',
              style: textLargerColor(
                  boldCondition: true, color: accentSecondColor),
            ),
            content: Text(message,
                textAlign: TextAlign.justify,
                style: textMediumColor(
                    boldCondition: false, color: accentSecondColor)),
            actions: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 1, color: accentColor))),
                  child: Text(
                    'Selesai',
                    style: TextStyle(color: accentColor),
                  ),
                ),
              )
            ]);
      },
    );
  }
}
