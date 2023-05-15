import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/constants/deviceSize.dart';
import '../../../constants/date_formatter.dart';
import '../../../constants/theme.dart';
import '../../../general_news/presentation/screens/more_info_news.dart';
import '../../../general_news/presentation/utils/box_shimmer.dart';
import '../../../top_headlines/data/repository/countries_service.dart';
import '../../logic/news_cat_vm_providers.dart';

class SportsCatScreen extends StatefulWidget {
  const SportsCatScreen({Key? key}) : super(key: key);

  @override
  State<SportsCatScreen> createState() => _SportsCatScreenState();
}

class _SportsCatScreenState extends State<SportsCatScreen> {
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
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios)),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Hero(
                      tag: "sports",
                      child: Text(
                        "Sports",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: PopupMenuButton(
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
                  }),
            ),
            Consumer(builder: (_, ref, child) {
              final vm = ref.watch(newsBitcoinCatVM(selectedCountry));
              return vm.when(data: (data) {
                final sortedArticles = data.articles
                  ?..sort((a, b) => b.publishedAt!.compareTo(a.publishedAt!));
                return sortedArticles!.isEmpty
                    ? Container(
                        padding: EdgeInsets.symmetric(
                            vertical: context.deviceHeight() / 3),
                        child:
                            Text("No news available for SPORTS at the moment"),
                      )
                    : Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: sortedArticles.length,
                            itemBuilder: (context, i) {
                              final article = sortedArticles[i];
                              final date = dateFormatter(
                                  article.publishedAt.toString(), "mm:ss");
                              return Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, CupertinoPageRoute(
                                        builder: (BuildContext context) {
                                      return MoreInfoNews(
                                        date: formatDate(
                                            article.publishedAt.toString()),
                                        sourceName: article.source.name,
                                        title: article.title,
                                        content: article.content,
                                        desc: article.description,
                                        image: article.urlToImage,
                                        sourceUrl: article.url,
                                      );
                                    }));
                                  },
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(article.title.toString(),
                                                    style: AppTextStyles
                                                        .headingMedium2TextBlack),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                    "${article.source.name.toString()} • $date",
                                                    style: AppTextStyles
                                                        .body2Regular),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 15),
                                          Expanded(
                                            child: article.urlToImage != null
                                                ? Container(
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                article
                                                                    .urlToImage
                                                                    .toString()),
                                                            fit: BoxFit.cover),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                  )
                                                : Container(
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                  ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 15),
                                        height: 4,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.topRight,
                                                colors: [
                                              appTheme.primaryColorDark,
                                              appTheme.dividerColor,
                                              Colors.transparent
                                            ])),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      );
              }, error: (err, stack) {
                return Text("Sports News Error: $err'");
              }, loading: () {
                return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, i) {
                        return GeneralNewsBoxShimmer();
                      }),
                );
              });
            })
          ],
        ),
      )),
    );
  }
}
