import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_series/presentation/bloc/movies/movies_bloc.dart';
import 'package:movies_series/presentation/bloc/movies_popular/movies_popular_bloc.dart';
import 'package:movies_series/presentation/bloc/movies_upcoming/movies_upcoming_bloc.dart';

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
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MainScreen(
          title: 'Movies and TV Series',
        ),
      ),
    );
  }
}
