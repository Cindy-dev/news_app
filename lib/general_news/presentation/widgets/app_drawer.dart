import 'package:flutter/material.dart';
import 'package:news_app/constants/deviceSize.dart';
import 'package:news_app/constants/slide_transition.dart';
import 'package:news_app/general_news/presentation/widgets/drawer_content.dart';


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
          child: SlideOpacityTransition(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DrawerContent(icon: Icons.newspaper, title: "Today\'s News"),
                  DrawerContent(icon: Icons.source, title: "News Source"),
                  DrawerContent(icon: Icons.flag, title: "Change Country"),
                ],
              ),
            ),
          ),
        ));
  }
}
