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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      'Male',
                      style: textMediumColor(
                          boldCondition: false, color: accentColor),
                    ),
                    SizedBox(
                      height: 8,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Instagram',
                style: textMediumColor(boldCondition: true, color: accentColor),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: accentColor,
              )
            ],
          ),
        ),
      ),
      InkWell(
        onTap: () => navigateToSocialMedia('https://github.com/gustavsr1994'),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Github',
                style: textMediumColor(boldCondition: true, color: accentColor),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Facebook',
                style: textMediumColor(boldCondition: true, color: accentColor),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
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
