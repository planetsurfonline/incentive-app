import 'package:flutter/material.dart';

/// Rounded border on some sides of a widget is tricky to achieve since Flutter's [BorderRadius] and [Border] don't
/// work together when the border is "not" on all sides.
///
/// The initial logic was found here: https://stackoverflow.com/a/61613471/5066615.
///
/// The way it's done here is to wrap the [child] in 2 [Container] widgets:
/// The outer [Container] has its background color set to [borderColor] i.e. what we want the border color to be.
/// The inner [Container] has its background color set to the background color of the widget behind the [child] so
/// that it appears to just have a border of [borderColor].
/// The inner [Container] also has a margin that is the same size as the [borderWidth].
class RoundedBorderOnSomeSidesWidget extends StatelessWidget {
  /// Color of the content behind this widget
  final Color contentBackgroundColor;
  final Color borderColor;
  final Widget child;

  final double borderRadius;
  final double borderWidth;

  /// The sides where we want the rounded border to be
  final bool topLeft;
  final bool topRight;
  final bool bottomLeft;
  final bool bottomRight;

  const RoundedBorderOnSomeSidesWidget({
    super.key,
    required this.borderColor,
    required this.contentBackgroundColor,
    required this.child,
    required this.borderRadius,
    required this.borderWidth,
    this.topLeft = false,
    this.topRight = false,
    this.bottomLeft = false,
    this.bottomRight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: borderColor,
        borderRadius: BorderRadius.only(
          topLeft: topLeft ? Radius.circular(borderRadius) : Radius.zero,
          topRight: topRight ? Radius.circular(borderRadius) : Radius.zero,
          bottomLeft: bottomLeft ? Radius.circular(borderRadius) : Radius.zero,
          bottomRight:
              bottomRight ? Radius.circular(borderRadius) : Radius.zero,
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(
          top: topLeft || topRight ? borderWidth : 0,
          left: topLeft || bottomLeft ? borderWidth : 0,
          bottom: bottomLeft || bottomRight ? borderWidth : 0,
          right: topRight || bottomRight ? borderWidth : 0,
        ),
        decoration: BoxDecoration(
          color: contentBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: topLeft
                ? Radius.circular(borderRadius - borderWidth)
                : Radius.zero,
            topRight: topRight
                ? Radius.circular(borderRadius - borderWidth)
                : Radius.zero,
            bottomLeft: bottomLeft
                ? Radius.circular(borderRadius - borderWidth)
                : Radius.zero,
            bottomRight: bottomRight
                ? Radius.circular(borderRadius - borderWidth)
                : Radius.zero,
          ),
        ),
        child: child,
      ),
    );
  }
}
