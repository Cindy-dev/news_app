import 'package:flutter/material.dart';
import 'package:news_app/constants/deviceSize.dart';
import 'package:news_app/constants/route_names.dart';
import 'package:news_app/constants/slide_transition.dart';
import 'package:news_app/constants/theme.dart';
import 'package:news_app/general_news/presentation/widgets/drawer_content.dart';
import 'package:news_app/news_categories/presentation/screens/health_cat_screen.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 4,
      width: context.deviceWidth() / 1.7,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 5),
                child: Text(
                  "News Categories",
                  style: AppTextStyles.headingMediumTextBlack,
                ),
              ),
              Divider(
                color: appTheme.primaryColorDark,
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    DrawerContent(
                        onTap: () => Navigator.pushNamed(
                            context, AppRoute.healthCatScreen),
                        image: "assets/images/hospital.png",
                        title: "Health"),
                    DrawerContent(
                        onTap: () => Navigator.pushNamed(
                            context, AppRoute.sportsCatScreen),
                        image: "assets/images/discover.png",
                        title: "Sports"),
                    DrawerContent(
                        onTap: () => Navigator.pushNamed(
                            context, AppRoute.bitcoinCatScreen),
                        image: "assets/images/bitcoin.png",
                        title: "Bitcoin"),
                    DrawerContent(
                        onTap: () => Navigator.pushNamed(
                            context, AppRoute.scienceCatScreen),
                        image: "assets/images/glass.png",
                        title: "Science"),
                    DrawerContent(
                        onTap: () => Navigator.pushNamed(
                            context, AppRoute.bitcoinCatScreen),
                        image: "assets/images/trend.png",
                        title: "Business"),
                    DrawerContent(
                        onTap: () => Navigator.pushNamed(
                            context, AppRoute.techCatScreen),
                        image: "assets/images/code.png",
                        title: "Technology"),
                    DrawerContent(
                        onTap: () => Navigator.pushNamed(
                            context, AppRoute.enterCatScreen),
                        image: "assets/images/musicnote.png",
                        title: "Entertainment"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
