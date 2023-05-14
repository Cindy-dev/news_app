import 'package:flutter/material.dart';
import 'package:news_app/general_news/presentation/screens/home_screen.dart';
import '../splash_screen.dart';

class AppRoute {
  static const String splashScreen = 'splashScreen';
  static const String homeScreen = 'homeScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
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
