import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movies_series/presentation/bloc/detail/detail_movie_bloc.dart';
import 'package:movies_series/presentation/bloc/movie/movies/movies_bloc.dart';
import 'package:movies_series/presentation/bloc/movie/movies_popular/movies_popular_bloc.dart';
import 'package:movies_series/presentation/bloc/movie/movies_upcoming/movies_upcoming_bloc.dart';
import 'package:movies_series/presentation/shared/style/colors_pallete.dart';
import 'package:movies_series/presentation/shared/utils/list_pages.dart';
import 'presentation/view/main/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MoviesBloc(),
        ),
        BlocProvider(
          create: (context) => MoviesUpcomingBloc(),
        ),
        BlocProvider(
          create: (context) => MoviesPopularBloc(),
        ),
        BlocProvider(
          create: (context) => DetailMovieBloc(),
          child: Container(),
        )
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        getPages: listPages,
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(color: mainColor),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                showUnselectedLabels: true,
                elevation: 3,
                unselectedItemColor: accentColor,
                selectedItemColor: accentSecondColor,
                selectedIconTheme:
                    IconThemeData(color: accentSecondColor, size: 25),
                backgroundColor: mainColor,
                showSelectedLabels: true,
                type: BottomNavigationBarType.fixed)),
        home: MainScreen(
          title: 'Movies',
        ),
      ),
    );
  }
}
