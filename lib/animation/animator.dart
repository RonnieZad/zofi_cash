import 'dart:async';
import 'package:flutter/material.dart';

class Animator extends StatefulWidget {
  const Animator(
      {Key? key,
      this.curve = Curves.linear,
      required this.builder,
      required this.delay})
      : super(key: key);
  final int delay;
  final Curve curve;
  final Function(BuildContext context, Widget? child, double value) builder;
  @override
  State<Animator> createState() => _AnimatorState();
}

class _AnimatorState extends State<Animator>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late Timer timer;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.delay), upperBound: .99, lowerBound: .1);
    animation = CurvedAnimation(parent: controller, curve: widget.curve);
    timer = Timer(const Duration(milliseconds: 200), controller.forward);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return widget.builder(context, child, animation.value);
      },
    );
  }
}
