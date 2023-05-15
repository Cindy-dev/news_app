import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/constants/date_formatter.dart';
import 'package:news_app/constants/deviceSize.dart';
import 'package:news_app/top_headlines/data/repository/countries_service.dart';
import 'package:news_app/top_headlines/logic/top_headline_vm.dart';
import '../../../constants/theme.dart';
import '../../../general_news/presentation/screens/more_info_news.dart';

class TopHeadlineCard extends StatefulWidget {
  const TopHeadlineCard({Key? key}) : super(key: key);

  @override
  State<TopHeadlineCard> createState() => _TopHeadlineCardState();
}

class _TopHeadlineCardState extends State<TopHeadlineCard> {
  String selectedCountry = "ng";

  void _onCountrySelected(String countryName) {
    final countryCode = CountriesService.countryCodes[countryName];
    if (countryCode == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "No article was found for this country, try selecting another country please",
        style: AppTextStyles.body2MediumWhite,
      )));
    }
    setState(() {
      selectedCountry = countryCode!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Top Headlines", style: AppTextStyles.headingMediumTextBlack),
            PopupMenuButton(
                onSelected: _onCountrySelected,
                child: Text(
                  "Select a Country",
                  style: AppTextStyles.body2Bold,
                ),
                itemBuilder: (context) {
                  return CountriesService.countryNames.map((country) {
                    return PopupMenuItem(
                      value: country,
                      child: Text(country),
                    );
                  }).toList();
                })
          ]),
        ),
        Consumer(builder: (_, ref, ch) {
          final vm = ref.watch(topHeadlineVM(selectedCountry));
          return vm.when(
              data: (data) {
                final sortedArticles = data.articles
                  ?..sort((a, b) => b.publishedAt!.compareTo(a.publishedAt!));
                return Container(
                  alignment: Alignment.center,
                  width: context.deviceWidth(),
                  height: context.deviceHeight() / 3.5,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: sortedArticles?.length,
                    itemBuilder: (context, i) {
                      final article = sortedArticles?[i];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, CupertinoPageRoute(
                              builder: (BuildContext context) {
                            return MoreInfoNews(
                              date: formatDate(article.publishedAt.toString()),
                              sourceName: article.source.name,
                              title: article.title,
                              content: article.content,
                              desc: article.description,
                              image: article.urlToImage,
                              sourceUrl: article.url,

                            );
                          }));
                        },
                        child: Stack(
                          children: [
                            article!.urlToImage == null
                                ? Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(right: 20),
                                    width: context.deviceWidth() / 1.2,
                                    height: context.deviceHeight() / 3,
                                    child: Text(
                                      "Image Preview Unavailable",
                                      style: AppTextStyles.body2MediumWhite,
                                    ),
                                    decoration: BoxDecoration(
                                        color: appTheme.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  )
                                : Container(
                                    width: context.deviceWidth() / 1.2,
                                    height: context.deviceHeight() / 3,
                                    margin: EdgeInsets.only(right: 20),
                                    decoration: BoxDecoration(
                                        color: appTheme.primaryColorDark,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              article.urlToImage.toString()),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  margin: EdgeInsets.only(right: 20),
                                  height: context.deviceHeight() / 13,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: appTheme.primaryColorDark
                                          .withOpacity(0.7),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30))),
                                  child: Text(
                                    article.title.toString(),
                                    style: AppTextStyles.body2MediumWhite,
                                  ),
                                ))
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
              error: (e,s) => Text(e.toString()),
              loading: () => Container(
                  height: context.deviceHeight() / 4,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator()));
        }),
      ],
    );
  }
}
