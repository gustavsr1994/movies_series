import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_series/presentation/bloc/seriesTv/series/series_bloc.dart';
import 'package:movies_series/presentation/bloc/seriesTv/series_popular/series_popular_bloc.dart';
import 'package:movies_series/presentation/shared/commons/result_state.dart';
import 'package:movies_series/presentation/shared/commons/widgets/card/card_all_item.dart';
import 'package:movies_series/presentation/shared/style/colors_pallete.dart';
import 'package:movies_series/presentation/shared/style/text_style_custom.dart';
import 'package:movies_series/presentation/view/series/detail/detail_series_screen.dart';

class AllSeriesScreen extends StatefulWidget {
  @override
  _AllSeriesScreenState createState() => _AllSeriesScreenState();
  static const routeName = '/allSeriesScreen';
}

class _AllSeriesScreenState extends State<AllSeriesScreen> {
  int indexPage = 0;
  @override
  void initState() {
    super.initState();
    switch (indexPage) {
      case 1:
        context.read<SeriesBloc>().add(GetListSeriesOnAir(page: 1));
        break;
      case 2:
        context.read<SeriesPopularBloc>().add(GetListSeriesPopular(page: 1));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final index = ModalRoute.of(context).settings.arguments as int;
    setState(() {
      indexPage = index;
    });return Scaffold(
        backgroundColor: mainColor,
        appBar: AppBar(
            title: Text(titlePage(index),
                style:
                    textLargerColor(boldCondition: true, color: accentColor))),
        body: bodyListSeries(index));
  }

  String titlePage(int index) {
    switch (index) {
      case 1:
        return 'Series On Air';
        break;
      case 2:
        return 'Series Popular';
        break;
      default:
        return '';
        break;
    }
  }

  Widget bodyListSeries(int index) {
    switch (index) {
      case 1:
        return BlocBuilder<SeriesBloc, SeriesState>(
          builder: (context, state) {
            if (state.state == ResultStateApi.Loading) {
              return Center(child: CircularProgressIndicator());
            } else if (state.state == ResultStateApi.HasData) {
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                children: List.generate(state.listSeries.length, (index) {
                  return CardAllItem(
                      onPress: () =>
                          _navigateToDetail(state.listSeries[index].id),
                      title: state.listSeries[index].title,
                      imagePoster: state.listSeries[index].imagePoster);
                }),
              );
            } else {
              return Center(child: Text('Error'));
            }
          },
        );
        break;
      case 2:
        return BlocBuilder<SeriesPopularBloc, SeriesPopularState>(
          builder: (context, state) {
            if (state.state == ResultStateApi.Loading) {
              return Center(child: CircularProgressIndicator());
            } else if (state.state == ResultStateApi.HasData) {
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                children: List.generate(state.listSeries.length, (index) {
                  return CardAllItem(
                      onPress: () =>
                          _navigateToDetail(state.listSeries[index].id),
                      title: state.listSeries[index].title,
                      imagePoster: state.listSeries[index].imagePoster);
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

  void _navigateToDetail(int id) {
    Navigator.pushNamed(context, DetailSeriesScreen.routeName, arguments: id);
  }
}
