import 'package:flutter/material.dart';
import 'package:news_app/constants/theme.dart';
import 'package:news_app/general_news/presentation/widgets/app_drawer.dart';
import 'package:news_app/general_news/presentation/widgets/latest_news.dart';
import 'package:news_app/top_headlines/presentation/widgets/top_headline_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      key: _scaffoldKey,
      drawer: AppDrawer(),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () => _scaffoldKey.currentState?.openDrawer(),
                  child: Image.asset(
                    "assets/images/menu.png",
                    scale: 1.5,
                  )),
              SizedBox(height: 25),
              Text("Find the Latest\nNews Updates",
                  style: AppTextStyles.displayLargeDarkBlack),
              TopHeadlineCard(),
              SizedBox(height: 30),
              LatestNews(),
            ],
          ),
        ),
      ),
    );
  }
}
