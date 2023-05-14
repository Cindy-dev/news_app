import 'package:flutter/material.dart';
import 'package:news_app/constants/deviceSize.dart';
import 'package:news_app/constants/theme.dart';
import 'package:news_app/general_news/presentation/widgets/more_info_header.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreInfoNews extends StatelessWidget {
  final String? date;
  final String? sourceName;
  final String? title;
  final String? country;
  final String? language;
  final String? desc;
  final String? content;
  final String? image;
  final String? sourceUrl;
  const MoreInfoNews(
      {Key? key,
      this.date,
      this.image,
      this.sourceName,
      this.title,
      this.country,
      this.language,
      this.desc,
      this.content,
      this.sourceUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back_ios)),
              MoreInfoHeader(
                date: date ?? "",
                source: sourceName ?? "",
              ),
              Text(
                title ?? "",
                style: AppTextStyles.headingMediumTextBlack,
              ),
              SizedBox(height: 35),
              Text(
                desc ?? "",
                style: AppTextStyles.headingMedium2TextBlack,
              ),
              SizedBox(height: 35),
              Text(
                "Read News",
                style: AppTextStyles.headingMediumTextBlack,
              ),
              image == null
                  ? Container(
                      margin: EdgeInsets.only(top: 30, bottom: 20),
                      alignment: Alignment.center,
                      width: context.deviceWidth() / 1.2,
                      height: context.deviceHeight() / 3,
                      child: Text(
                        "Image Preview Unavailable",
                        style: AppTextStyles.body2MediumWhite,
                      ),
                      decoration: BoxDecoration(
                          color: appTheme.primaryColor,
                          borderRadius: BorderRadius.circular(20)),
                    )
                  : Container(
                      margin: EdgeInsets.only(top: 30, bottom: 20),
                      width: context.deviceWidth() / 1.2,
                      height: context.deviceHeight() / 3,
                      decoration: BoxDecoration(
                          color: appTheme.primaryColorDark,
                          image: DecorationImage(
                            image: NetworkImage(image!),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                    ),
              Text(
                content ?? "",
                style: AppTextStyles.body2Regular,
              ),
              TextButton(
                onPressed: () => canLaunchUrl(
                  Uri.parse(sourceUrl!),
                ),
                child: Text(
                  "Got to Source Link",
                  style: AppTextStyles.body2Regular,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
