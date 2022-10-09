import 'package:flutter/material.dart';
import 'package:movies_series/presentation/shared/style/colors_pallete.dart';
import 'package:movies_series/presentation/shared/style/text_style_custom.dart';
import 'package:movies_series/presentation/view/about/about_screen.dart';
import 'package:movies_series/presentation/view/movies/movies_screen.dart';

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
      icon: Icon(Icons.portrait, color: accentColor),
      label: 'About Me',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title,
              style: textLargerColor(boldCondition: true, color: accentColor))),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: [MoviesScreen(), AboutScreen()],
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
