import 'package:flutter/material.dart';
import 'package:movies_series/presentation/bloc/movie/movies/movies_bloc.dart';
import 'package:movies_series/presentation/shared/commons/result_state.dart';
import 'package:movies_series/presentation/shared/commons/widgets/card/card_list_title.dart';
import 'package:movies_series/presentation/shared/style/colors_pallete.dart';
import 'package:movies_series/presentation/shared/style/text_style_custom.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllMoviesScreen extends StatefulWidget {
  @override
  _AllMoviesScreenState createState() => _AllMoviesScreenState();
  static const routeName = '/allMoviesScreen';
}

class _AllMoviesScreenState extends State<AllMoviesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MoviesBloc>().add(GetListMoviesNowPlaying(page: 1));
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
          title: Text(args,
              style: textLargerColor(boldCondition: true, color: accentColor))),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state.state == ResultStateApi.Loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.state == ResultStateApi.HasData) {
            return GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.listMovies.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return CardListTitle(
                    title: state.listMovies[index].title,
                    adult: state.listMovies[index].adult,
                    imagePoster: state.listMovies[index].imagePoster,
                    releaseDate: state.listMovies[index].releaseDate,
                    popularity: state.listMovies[index].popularity,
                    content: state.listMovies[index].content,
                    onPressed: null);
              },
            );
          } else {
            return Center(child: Text('Error'));
          }
        },
      ),
    );
  }
}
