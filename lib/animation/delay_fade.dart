import 'dart:async';
import 'package:flutter/material.dart';

class DelayedFade extends StatefulWidget {
  const DelayedFade({Key? key, required this.child, required this.delay})
      : super(key: key);
  final Widget child;
  final int delay;

  @override
  State<DelayedFade> createState() => _DelayedFadeState();
}

class _DelayedFadeState extends State<DelayedFade>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _controller);
    _animOffset = Tween<Offset>(begin: const Offset(0.0, 0.1), end: Offset.zero)
        .animate(curve);

    Timer(Duration(milliseconds: widget.delay), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
    );
  }
}
