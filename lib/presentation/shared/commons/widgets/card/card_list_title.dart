import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_series/presentation/shared/style/colors_pallete.dart';
import 'package:movies_series/presentation/shared/style/text_style_custom.dart';

class CardListTitle extends StatelessWidget {
  final String title;
  final bool adult;
  final String imagePoster;
  final String releaseDate;
  final String popularity;
  final String content;
  final String rating;
  final Function onPressed;

  CardListTitle(
      {@required this.title,
      @required this.adult,
      @required this.imagePoster,
      @required this.releaseDate,
      @required this.popularity,
      @required this.content,
      @required this.rating,
      @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.amber,
                blurRadius: 8.0,
              ),
            ],
            color: Colors.black,
            border: Border.all(color: Colors.amber),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          margin: EdgeInsets.only(right: 20),
          padding: EdgeInsets.all(8.0),
          width: 150,
          height: 260,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            imagePoster,
                          ),
                          fit: BoxFit.fill,
                        )),
                    height: 170,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 8,
                    padding: EdgeInsets.all(1),
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          rating,
                          style:
                              TextStyle(color: accentSecondColor, fontSize: 16),
                        ),
                        Icon(
                          Icons.star,
                          color: accentColor,
                          size: 15,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 18),
              Text(
                title,
                style: textMediumColor(boldCondition: true, color: accentColor),
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ));
  }
}
