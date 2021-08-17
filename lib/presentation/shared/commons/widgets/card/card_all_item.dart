import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_series/presentation/shared/style/colors_pallete.dart';
import 'package:movies_series/presentation/shared/style/text_style_custom.dart';

class CardAllItem extends StatelessWidget {
  final String title;
  final String imagePoster;
  final Function onPress;
  CardAllItem(
      {@required this.title,
      @required this.imagePoster,
      @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                imagePoster,
              ),
              fit: BoxFit.fill,
            )),
        height: 170,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                height: MediaQuery.of(context).size.height / 14,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  color: Colors.white60,
                ),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: textMediumColor(boldCondition: true, color: mainColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
