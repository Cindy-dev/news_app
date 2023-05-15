import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/constants/date_formatter.dart';
import 'package:news_app/general_news/logic/general_news_vm.dart';
import 'package:news_app/general_news/presentation/utils/box_shimmer.dart';
import '../../../constants/theme.dart';
import '../screens/more_info_news.dart';

class GeneralNews extends ConsumerWidget {
  const GeneralNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(generalNewsVM);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("General News", style: AppTextStyles.headingMediumTextBlack),
              IconButton(
                  onPressed: () => ref.refresh(generalNewsVM.future),
                  icon: Icon(Icons.refresh))
            ],
          ),
          vm.when(data: (data) {
            final sortedArticles = data.articles
              ?..sort((a, b) => b.publishedAt!.compareTo(a.publishedAt!));
            return Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: sortedArticles?.length,
                  itemBuilder: (context, i) {
                    final article = sortedArticles![i];
                    final date =
                        dateFormatter(article.publishedAt.toString(), "mm:ss");
                    return Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: GestureDetector(
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
                                          style: AppTextStyles.body2Regular),
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
                                                  image: NetworkImage(article
                                                      .urlToImage
                                                      .toString()),
                                                  fit: BoxFit.cover),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        )
                                      : Container(
                                          height: 100,
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
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
            return Text("'General News Error: $err'");
          }, loading: () {
            return Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return GeneralNewsBoxShimmer();
                  }),
            );
          })
        ],
      ),
    );
  }
}
