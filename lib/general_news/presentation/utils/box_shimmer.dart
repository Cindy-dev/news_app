import 'package:flutter/material.dart';
import 'package:news_app/constants/deviceSize.dart';
import 'package:shimmer/shimmer.dart';
import '../../../constants/theme.dart';

class GeneralNewsBoxShimmer extends StatelessWidget {
  const GeneralNewsBoxShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
      baseColor: appTheme.primaryColor,
      highlightColor: Colors.grey[100]!,
      period: Duration(seconds: 2),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: context.deviceHeight() / 20,
                      decoration: BoxDecoration(
                          color: appTheme.primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: context.deviceHeight() / 30,
                      decoration: BoxDecoration(
                          color: appTheme.primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: appTheme.primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ]),
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
      ));
}
