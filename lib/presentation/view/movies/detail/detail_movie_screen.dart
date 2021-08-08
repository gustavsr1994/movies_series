import 'package:flutter/material.dart';
import 'package:movies_series/presentation/shared/style/colors_pallete.dart';
import 'package:movies_series/presentation/shared/style/text_style_custom.dart';

class DetailMovieScreen extends StatefulWidget {
  @override
  _DetailMovieScreenState createState() => _DetailMovieScreenState();
  static const routeName = '/detailMovieScreen';
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
          title: Text(args,
              style: textLargerColor(boldCondition: true, color: accentColor))),
    );
  }
}
