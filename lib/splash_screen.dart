import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/constants/deviceSize.dart';
import 'package:news_app/general_news/presentation/screens/home_screen.dart';
import 'constants/animated_page_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  int count = 0;
  late final AnimationController _lottieController;

  @override
  void initState() {
    super.initState();
    _lottieController = AnimationController(vsync: this);
    _lottieController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _lottieController.reverse();
      }
    });
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          CustomPageRoute(
              transitionDuration: Duration(milliseconds: 700),
              child: HomeScreen(),
              begin: Offset(-1, 0)));
    });
  }

  @override
  void dispose() {
    _lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        alignment: Alignment.center,
        height: context.deviceHeight(),
        child: Lottie.asset(
          'assets/json/newspaper.json',
          fit: BoxFit.cover,
          width: context.deviceHeight(),
          controller: _lottieController,
          onLoaded: (composition) {
            _lottieController
              ..duration = composition.duration
              ..forward();
          },
        ),
      ),
    );
  }
}
