import 'package:flutter/material.dart';
import 'package:smart_home_iot/utils/constants.dart';

class ShadowBox extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Gradient gradient;
  final Widget child;

  const ShadowBox({
    Key key,
    this.width,
    this.height,
    this.margin = const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
    this.padding = const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
    this.borderRadius = 12.0,
    this.gradient,
    this.child,
  })  : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: Colors.white,
        gradient: gradient,
        boxShadow: [
          BoxShadow(color: c(0xFF20000000), blurRadius: 6.0, offset: Offset(0, 0), spreadRadius: 4.0),
        ],
      ),
      child: child,
    );
  }
}
