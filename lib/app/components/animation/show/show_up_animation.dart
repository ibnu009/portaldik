import 'dart:async';

import 'package:flutter/material.dart';

import 'direction.dart';

class ShowUpAnimation extends StatefulWidget {
  final Widget child;
  final double offset;
  final Curve curve;
  final Direction direction;
  final Duration delayStart;
  final Duration animationDuration;
  final double fadeBegin;
  final bool enableSlideAnimation;
  final Animation<double>? fadeAnimation;

  const ShowUpAnimation({
    required this.child,
    this.offset = 0.2,
    this.curve = Curves.easeIn,
    this.direction = Direction.vertical,
    this.delayStart = const Duration(seconds: 0),
    this.animationDuration = const Duration(milliseconds: 800),
    this.fadeBegin = -1.0,
    this.enableSlideAnimation = true,
    this.fadeAnimation,
    Key? key,
  }) : super(key: key);

  @override
  _ShowUpAnimationState createState() => _ShowUpAnimationState();
}

class _ShowUpAnimationState extends State<ShowUpAnimation>
    with SingleTickerProviderStateMixin {
  Animation<Offset>? _animationSlide;

  AnimationController? _animationController;

  late Animation<double> _animationFade;

  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    if (_isDisposed) {
      return;
    } else {
      _animationController = AnimationController(
        vsync: this,
        duration: widget.animationDuration,
      );

      if (widget.enableSlideAnimation) {
        if (widget.direction == Direction.vertical) {
          _animationSlide =
              Tween<Offset>(begin: Offset(0, widget.offset), end: const Offset(0, 0))
                  .animate(CurvedAnimation(
                curve: widget.curve,
                parent: _animationController!,
              ));
        } else {
          _animationSlide =
              Tween<Offset>(begin: Offset(widget.offset, 0), end: const Offset(0, 0))
                  .animate(CurvedAnimation(
                curve: widget.curve,
                parent: _animationController!,
              ));
        }
      }

      _animationFade = widget.fadeAnimation ??
          Tween<double>(begin: widget.fadeBegin, end: 1.0).animate(
              CurvedAnimation(
                curve: widget.curve,
                parent: _animationController!,
              ));

      Timer(widget.delayStart, () {
        if (_animationController != null && !_isDisposed) {
          _animationController!.forward();
        }
      });
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = widget.child;
    if (widget.enableSlideAnimation && _animationSlide != null) {
      child = SlideTransition(
        position: _animationSlide!,
        child: child,
      );
    }
    return FadeTransition(
      opacity: _animationFade,
      child: child,
    );
  }
}