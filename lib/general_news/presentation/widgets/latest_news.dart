import 'package:flutter/material.dart';

import '../../../constants/theme.dart';

class LatestNews extends StatelessWidget {
  const LatestNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: [
          Text("Latest News", style: AppTextStyles.headingMediumTextBlack),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Ola e-scooters go on sale: Here’s...",
                          style: AppTextStyles.headingMediumTextBlack),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Ola e-scooters", style: AppTextStyles.body2Regular),
                    ],
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ],
            ),
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
    );
  }
}
