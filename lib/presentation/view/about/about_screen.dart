import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_series/presentation/shared/style/colors_pallete.dart';
import 'package:movies_series/presentation/shared/style/text_style_custom.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: accentColor,
                    blurRadius: 7.0,
                  ),
                ],
                color: Colors.black,
                border: Border.all(color: accentColor),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Card(
                color: mainColor,
                margin: EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: CircleAvatar(
                          backgroundColor: accentColor,
                          foregroundColor: mainColor,
                          minRadius: 30,
                          maxRadius: 50,
                          backgroundImage: NetworkImage(
                            'https://scontent.fcgk6-2.fna.fbcdn.net/v/t1.6435-9/90113200_3046765945336505_3894333214780555264_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeEFwVeZWJNwrrBUqlQCeALy4N2M3m-dg-3g3Yzeb52D7c6MLUImX-THkE-esym1dtOHDZYK76uBn-qWBTRFsHdp&_nc_ohc=9a7vDkI8lREAX99JFU5&_nc_ht=scontent.fcgk6-2.fna&oh=8a3b192fb11e69110720d11245086fbb&oe=615122A8',
                          )),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Gustav Sri Raharjo',
                            style: textLargerColor(
                                boldCondition: true, color: accentColor),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            '08569xxxxxx',
                            style: textMediumColor(
                                boldCondition: false, color: accentColor),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Indonesia',
                            style: textMediumColor(
                                boldCondition: false, color: accentColor),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Text(
                'Tech in Used',
                style: textLargerColor(boldCondition: true, color: accentColor),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Text(
                'Bloc, Dio, GetX',
                style:
                    textMediumColor(boldCondition: false, color: accentColor),
              ),
            ),
            Divider(
              color: accentColor,
            ),
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Text(
                'My Contact Person',
                style: textLargerColor(boldCondition: true, color: accentColor),
              ),
            ),
            bodyMyProfile(context),
          ],
        ),
      ),
    );
  }
}

Widget bodyMyProfile(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      InkWell(
        onTap: () =>
            navigateToSocialMedia('https://www.instagram.com/gustavsri/'),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: accentColor),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Instagram',
                style: textMediumColor(boldCondition: true, color: accentColor),
              ),
              Icon(
                Icons.arrow_right_sharp,
                color: accentColor,
              )
            ],
          ),
        ),
      ),
      InkWell(
        onTap: () =>
            navigateToSocialMedia('https://github.com/gustavsr1994'),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: accentColor),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Github',
                style: textMediumColor(boldCondition: true, color: accentColor),
              ),
              Icon(
                Icons.arrow_right_sharp,
                color: accentColor,
              )
            ],
          ),
        ),
      ),
      InkWell(
        onTap: () =>
            navigateToSocialMedia('https://www.facebook.com/gustavsri'),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: accentColor),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Facebook',
                style: textMediumColor(boldCondition: true, color: accentColor),
              ),
              Icon(
                Icons.arrow_right_sharp,
                color: accentColor,
              )
            ],
          ),
        ),
      )
    ],
  );
}

void navigateToSocialMedia(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      universalLinksOnly: true,
    );
  } else {
    throw 'There was a problem to open the url: $url';
  }
}
