import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class FocusAnimated extends StatefulWidget {
  final Widget Function(BuildContext, double) builder;
  final double unfocusedSize;
  final double focusedSize;

  const FocusAnimated({
    super.key,
    required this.builder,
    required this.unfocusedSize,
    required this.focusedSize
  });

  @override
  State<FocusAnimated> createState() => FocusAnimatedState(focusAnimated: this);
}

class FocusAnimatedState extends State<FocusAnimated> {
  final FocusAnimated focusAnimated;
  double size;

  FocusAnimatedState({
    required this.focusAnimated,
  }) : size = focusAnimated.unfocusedSize;

  void _updateSize(bool hasFocus) {
    setState(() {
      size = hasFocus ? focusAnimated.focusedSize : focusAnimated.unfocusedSize;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: _updateSize,
      child: AnimatedSize(
        curve: Curves.easeIn,
        duration: const Duration(seconds: 1),
        child: focusAnimated.builder(context, size)
      ),
    );
  }
}