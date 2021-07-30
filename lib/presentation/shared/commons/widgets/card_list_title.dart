import 'dart:ui';

import 'package:flutter/material.dart';

class CardListTitle extends StatelessWidget {
  final String title;
  final bool adult;
  final String releaseDate;
  final String popularity;
  final String content;
  final Function onPressed;

  CardListTitle(
      {@required this.title,
      @required this.adult,
      @required this.releaseDate,
      @required this.popularity,
      @required this.content,
      @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    adult == true
                        ? Expanded(
                            flex: 5,
                            child: Text(
                              'Type : Adult',
                              style: TextStyle(color: Colors.red, fontSize: 10),
                            ),
                          )
                        : SizedBox(),
                    Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.grey.shade500,
                            size: 16.0,
                          ),
                        )),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  content,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Released Date : $releaseDate',
                    style: TextStyle(color: Colors.red, fontSize: 10),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Popularity : $popularity',
                    style: TextStyle(color: Colors.red, fontSize: 10),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ));
  }
}
