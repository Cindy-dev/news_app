import 'package:flutter/cupertino.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;
  final Offset? begin;
  final Duration transitionDuration;

  CustomPageRoute({
    required this.transitionDuration,
    required this.child,
    required this.begin,
  }) : super(
      transitionDuration: transitionDuration,
      pageBuilder: (context, animation, secondaryAnimation) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
        position:
        Tween<Offset>(begin: begin, end: Offset.zero).animate(animation),
        child: child,
      );
}
