import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movies_series/presentation/bloc/movie/movies/movies_bloc.dart';
import 'package:movies_series/presentation/bloc/movie/movies_popular/movies_popular_bloc.dart';
import 'package:movies_series/presentation/bloc/movie/movies_upcoming/movies_upcoming_bloc.dart';
import 'package:movies_series/presentation/shared/commons/result_state.dart';
import 'package:movies_series/presentation/shared/commons/widgets/card/card_list_title.dart';
import 'package:movies_series/presentation/shared/style/colors_pallete.dart';
import 'package:movies_series/presentation/shared/style/text_style_custom.dart';
import 'package:movies_series/presentation/view/movies/all/all_movies_screen.dart';
import 'package:movies_series/presentation/view/movies/detail/detail_movie_screen.dart';

class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MoviesBloc>().add(GetListMoviesNowPlaying(page: 1));
    context.read<MoviesUpcomingBloc>().add(GetListMoviesUpcoming(page: 1));
    context.read<MoviesPopularBloc>().add(GetListMoviesPopular(page: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: Text('Movies Now Playing',
                            style: textLargerColor(
                                boldCondition: true, color: accentColor)),
                      ),
                      InkWell(
                        onTap: () => _navigateToAllMovie(1),
                        child: Text(
                          'View All',
                          style: textSmallColor(
                              boldCondition: true, color: accentColor),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 6),
                  BlocBuilder<MoviesBloc, MoviesState>(
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
                                  index < state.listMovies.length;
                                  index++)
                                CardListTitle(
                                    title: state.listMovies[index].title,
                                    adult: state.listMovies[index].adult,
                                    imagePoster:
                                        state.listMovies[index].imagePoster,
                                    releaseDate:
                                        state.listMovies[index].releaseDate,
                                    popularity:
                                        state.listMovies[index].popularity,
                                    content: state.listMovies[index].content,
                                    onPressed: () => _navigateToDetail(
                                        state.listMovies[index].id,
                                        state.listMovies[index].imagePoster))
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
                        child: Text('Movies Upcoming',
                            style: textLargerColor(
                                boldCondition: true, color: accentColor)),
                      ),
                      InkWell(
                        onTap: () => _navigateToAllMovie(2),
                        child: Text(
                          'View All',
                          style: textSmallColor(
                              boldCondition: true, color: accentColor),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 6),
                  BlocBuilder<MoviesUpcomingBloc, MoviesUpcomingState>(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              for (var index = 0;
                                  index < state.listMovies.length;
                                  index++)
                                CardListTitle(
                                    title: state.listMovies[index].title,
                                    adult: state.listMovies[index].adult,
                                    imagePoster:
                                        state.listMovies[index].imagePoster,
                                    releaseDate:
                                        state.listMovies[index].releaseDate,
                                    popularity:
                                        state.listMovies[index].popularity,
                                    content: state.listMovies[index].content,
                                    onPressed: () => _navigateToDetail(
                                        state.listMovies[index].id,
                                        state.listMovies[index].imagePoster))
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
                        child: Text('Movies Popular',
                            style: textLargerColor(
                                boldCondition: true, color: accentColor)),
                      ),
                      InkWell(
                        onTap: () => _navigateToAllMovie(3),
                        child: Text(
                          'View All',
                          style: textSmallColor(
                              boldCondition: true, color: accentColor),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 6),
                  BlocBuilder<MoviesPopularBloc, MoviesPopularState>(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              for (var index = 0;
                                  index < state.listMovies.length;
                                  index++)
                                CardListTitle(
                                    title: state.listMovies[index].title,
                                    adult: state.listMovies[index].adult,
                                    imagePoster:
                                        state.listMovies[index].imagePoster,
                                    releaseDate:
                                        state.listMovies[index].releaseDate,
                                    popularity:
                                        state.listMovies[index].popularity,
                                    content: state.listMovies[index].content,
                                    onPressed: () => _navigateToDetail(
                                        state.listMovies[index].id,
                                        state.listMovies[index].imagePoster))
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

  void _navigateToAllMovie(int index) {
    Get.to(AllMoviesScreen(
      indexPage: index,
    ));
  }

  void _navigateToDetail(int id, String urlImage) {
    Get.to(DetailMovieScreen(
      index: id,
      image: urlImage,
    ));
  }
}
