import 'package:flutter/material.dart';
import 'package:movies_series/presentation/shared/style/colors_pallete.dart';
import 'package:movies_series/presentation/shared/style/text_style_custom.dart';
import 'package:movies_series/presentation/view/movies/movies_screen.dart';
import 'package:movies_series/presentation/view/series/series_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
  final String title;
  MainScreen({this.title});
}

class _MainScreenState extends State<MainScreen> {
  int _bottomNavIndex = 0;
  List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.movie, color: accentColor),
      label: 'Movies',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.tv, color: accentColor),
      label: 'TV Series',
    )
  ];

  List<Widget> _listWidget() => [MoviesScreen(), SeriesScreen()];

  @override
  Widget build(BuildContext context) {
    final List<Widget> listWidget = _listWidget();
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title,
              style: textLargerColor(boldCondition: true, color: accentColor))),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: listWidget,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavBarItems,
        type: BottomNavigationBarType.fixed,
        currentIndex: _bottomNavIndex,
        onTap: (value) {
          setState(() {
            _bottomNavIndex = value;
          });
        },
      ),
    );
  }
}
