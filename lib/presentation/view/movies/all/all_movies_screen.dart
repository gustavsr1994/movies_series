import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_series/presentation/bloc/movie/movies/movies_bloc.dart';
import 'package:movies_series/presentation/bloc/movie/movies_popular/movies_popular_bloc.dart';
import 'package:movies_series/presentation/bloc/movie/movies_upcoming/movies_upcoming_bloc.dart';
import 'package:movies_series/presentation/shared/commons/result_state.dart';
import 'package:movies_series/presentation/shared/commons/widgets/card/card_all_item.dart';
import 'package:movies_series/presentation/shared/style/colors_pallete.dart';
import 'package:movies_series/presentation/shared/style/text_style_custom.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_series/presentation/view/movies/detail/detail_movie_screen.dart';

class AllMoviesScreen extends StatefulWidget {
  @override
  _AllMoviesScreenState createState() => _AllMoviesScreenState();
  final int indexPage;
  AllMoviesScreen({this.indexPage});
}

class _AllMoviesScreenState extends State<AllMoviesScreen> {
  @override
  void initState() {
    super.initState();
    switch (widget.indexPage) {
      case 1:
        context.read<MoviesBloc>().add(GetListMoviesNowPlaying(page: 1));
        break;
      case 2:
        context.read<MoviesUpcomingBloc>().add(GetListMoviesUpcoming(page: 1));
        break;
      case 3:
        context.read<MoviesPopularBloc>().add(GetListMoviesPopular(page: 1));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        appBar: AppBar(
            leading: BackButton(
              color: accentColor,
            ),
            title: Text(titlePage(widget.indexPage),
                style:
                    textLargerColor(boldCondition: true, color: accentColor))),
        body: bodyListMovies(widget.indexPage));
  }

  String titlePage(int index) {
    switch (index) {
      case 1:
        return 'Movies Now Playing';
        break;
      case 2:
        return 'Movies Upcoming';
        break;
      case 3:
        return 'Movies Popular';
        break;
      default:
        return '';
        break;
    }
  }

  Widget bodyListMovies(int index) {
    switch (index) {
      case 1:
        return BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            if (state.state == ResultStateApi.Loading) {
              return Center(child: CircularProgressIndicator());
            } else if (state.state == ResultStateApi.HasData) {
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                children: List.generate(state.listMovies.length, (index) {
                  return CardAllItem(
                    onPress: () => _navigateToDetail(state.listMovies[index].id,
                        state.listMovies[index].imagePoster),
                    title: state.listMovies[index].title,
                    imagePoster: state.listMovies[index].imagePoster,
                    rating: state.listMovies[index].rating,
                  );
                }),
              );
            } else {
              return Center(child: Text('Error'));
            }
          },
        );
        break;
      case 2:
        return BlocBuilder<MoviesUpcomingBloc, MoviesUpcomingState>(
          builder: (context, state) {
            if (state.state == ResultStateApi.Loading) {
              return Center(child: CircularProgressIndicator());
            } else if (state.state == ResultStateApi.HasData) {
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                children: List.generate(state.listMovies.length, (index) {
                  return CardAllItem(
                    onPress: () => _navigateToDetail(state.listMovies[index].id,
                        state.listMovies[index].imagePoster),
                    title: state.listMovies[index].title,
                    imagePoster: state.listMovies[index].imagePoster,
                    rating: state.listMovies[index].rating,
                  );
                }),
              );
            } else {
              return Center(child: Text('Error'));
            }
          },
        );
        break;
      case 3:
        return BlocBuilder<MoviesPopularBloc, MoviesPopularState>(
          builder: (context, state) {
            if (state.state == ResultStateApi.Loading) {
              return Center(child: CircularProgressIndicator());
            } else if (state.state == ResultStateApi.HasData) {
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                children: List.generate(state.listMovies.length, (index) {
                  return CardAllItem(
                    onPress: () => _navigateToDetail(state.listMovies[index].id,
                        state.listMovies[index].imagePoster),
                    title: state.listMovies[index].title,
                    imagePoster: state.listMovies[index].imagePoster,
                    rating: state.listMovies[index].rating,
                  );
                }),
              );
            } else {
              return Center(child: Text('Error'));
            }
          },
        );
        break;
      default:
        return Container();
        break;
    }
  }

  void _navigateToDetail(int id, String urlImage) {
    Get.to(DetailMovieScreen(
      index: id,
      image: urlImage,
    ));
  }
}
