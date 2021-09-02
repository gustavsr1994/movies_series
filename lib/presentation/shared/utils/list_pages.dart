import 'package:get/get.dart';
import 'package:movies_series/presentation/view/main/main_screen.dart';
import 'package:movies_series/presentation/view/movies/all/all_movies_screen.dart';
import 'package:movies_series/presentation/view/movies/detail/detail_movie_screen.dart';

var listPages = [
  GetPage(name: '/', page: () => MainScreen(), transition: Transition.fade),
  GetPage(
      name: '/all', page: () => AllMoviesScreen(), transition: Transition.fade),
  GetPage(
      name: '/detail',
      page: () => DetailMovieScreen(),
      transition: Transition.fade),
];
