import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_series/presentation/bloc/movies/movies_bloc.dart';
import 'package:movies_series/presentation/bloc/movies_popular/movies_popular_bloc.dart';
import 'package:movies_series/presentation/bloc/movies_upcoming/movies_upcoming_bloc.dart';
import 'package:movies_series/presentation/shared/commons/result_state.dart';
import 'package:movies_series/presentation/shared/commons/widgets/card_list_title.dart';

class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MoviesBloc>().add(GetListMoviesNowPlaying());
    context.read<MoviesUpcomingBloc>().add(GetListMoviesUpcoming());
    context.read<MoviesPopularBloc>().add(GetListMoviesPopular());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Movies Now Playing'),
                  BlocBuilder<MoviesBloc, MoviesState>(
                    builder: (context, state) {
                      if (state.state == ResultStateApi.Loading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state.state == ResultStateApi.HasData) {
                        return Column(
                          children: [
                            for (var index = 0;
                                index < state.listMovies.length;
                                index++)
                              CardListTitle(
                                  title: state.listMovies[index].title,
                                  adult: state.listMovies[index].adult,
                                  releaseDate:
                                      state.listMovies[index].releaseDate,
                                  popularity:
                                      state.listMovies[index].popularity,
                                  content: state.listMovies[index].content,
                                  onPressed: null)
                          ],
                        );
                      } else {
                        return Center(child: Text('Error'));
                      }
                      return Container();
                    },
                  ),
                ],
              )),
          Container(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Movies Upcoming'),
                  BlocBuilder<MoviesUpcomingBloc, MoviesUpcomingState>(
                    builder: (context, state) {
                      if (state.state == ResultStateApi.Loading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state.state == ResultStateApi.HasData) {
                        return Column(
                          children: [
                            for (var index = 0;
                                index < state.listMovies.length;
                                index++)
                              CardListTitle(
                                  title: state.listMovies[index].title,
                                  adult: state.listMovies[index].adult,
                                  releaseDate:
                                      state.listMovies[index].releaseDate,
                                  popularity:
                                      state.listMovies[index].popularity,
                                  content: state.listMovies[index].content,
                                  onPressed: null)
                          ],
                        );
                      } else {
                        return Center(child: Text('Error'));
                      }
                      return Container();
                    },
                  ),
                ],
              )),
          Container(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Movies Popular'),
                  BlocBuilder<MoviesPopularBloc, MoviesPopularState>(
                    builder: (context, state) {
                      if (state.state == ResultStateApi.Loading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state.state == ResultStateApi.HasData) {
                        return Column(
                          children: [
                            for (var index = 0;
                                index < state.listMovies.length;
                                index++)
                              CardListTitle(
                                  title: state.listMovies[index].title,
                                  adult: state.listMovies[index].adult,
                                  releaseDate:
                                      state.listMovies[index].releaseDate,
                                  popularity:
                                      state.listMovies[index].popularity,
                                  content: state.listMovies[index].content,
                                  onPressed: null)
                          ],
                        );
                      } else {
                        return Center(child: Text('Error'));
                      }
                      return Container();
                    },
                  ),
                ],
              )),
        ],
      )),
    );
  }
}
