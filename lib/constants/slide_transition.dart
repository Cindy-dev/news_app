import 'package:flutter/material.dart';

class SlideOpacityTransition extends StatefulWidget {
  final Widget child;
  final Duration? duration;
  const SlideOpacityTransition({Key? key, required this.child, this.duration})
      : super(key: key);

  @override
  State<SlideOpacityTransition> createState() => _SlideOpacityTransitionState();
}

class _SlideOpacityTransitionState extends State<SlideOpacityTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  final slideTween = Tween<Offset>(begin: Offset(1, 0.15), end: Offset.zero);

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? Duration(milliseconds: 700),
    );
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: widget.child,
      builder: (_, child) {
        return Opacity(
          opacity: controller.value,
          child: SlideTransition(
            position: slideTween.animate(controller),
            child: child!,
          ),
        );
      },
    );
  }
}
