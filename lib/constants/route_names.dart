import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/general_news/presentation/screens/home_screen.dart';
import 'package:news_app/news_categories/presentation/screens/bitcoin_cat_screen.dart';
import 'package:news_app/news_categories/presentation/screens/entertainment_cat_screen.dart';
import 'package:news_app/news_categories/presentation/screens/health_cat_screen.dart';
import 'package:news_app/news_categories/presentation/screens/sports_cat_screen.dart';
import 'package:news_app/news_categories/presentation/screens/technology_cat_screen.dart';
import '../news_categories/presentation/screens/business_cat_screen.dart';
import '../news_categories/presentation/screens/science_cat_screen.dart';
import '../splash_screen.dart';

class AppRoute {
  static const String splashScreen = 'splashScreen';
  static const String homeScreen = 'homeScreen';
  static const String healthCatScreen = 'healthCatScreen';
  static const String sportsCatScreen = 'sportsCatScreen';
  static const String bitcoinCatScreen = 'bitcoinCatScreen';
  static const String scienceCatScreen = 'scienceCatScreen';
  static const String businessCatScreen = 'businessCatScreen';
  static const String techCatScreen = 'techCatScreen';
  static const String enterCatScreen = 'enterCatScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case healthCatScreen:
        return CupertinoPageRoute(
            builder: (context) => const HealthCatScreen());
      case sportsCatScreen:
        return CupertinoPageRoute(
            builder: (context) => const SportsCatScreen());
      case bitcoinCatScreen:
        return CupertinoPageRoute(
            builder: (context) => const BitcoinCatScreen());
      case scienceCatScreen:
        return CupertinoPageRoute(
            builder: (context) => const ScienceCatScreen());
      case businessCatScreen:
        return CupertinoPageRoute(
            builder: (context) => const BusinessCatScreen());
      case techCatScreen:
        return CupertinoPageRoute(builder: (context) => const TechCatScreen());
      case enterCatScreen:
        return CupertinoPageRoute(
            builder: (context) => const EntertainmentCatScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => errorView(settings.name),
        );
    }
  }

  static Widget errorView(String? name) {
    return Scaffold(body: Center(child: Text('404 $name View not found')));
  }
}
