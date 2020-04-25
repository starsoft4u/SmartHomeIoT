import 'package:flutter/material.dart';
import 'package:smart_home_iot/utils/constants.dart';

class PlainButton extends StatelessWidget {
  final String title;
  final TextStyle titleStyle;
  final void Function() onPressed;
  final Widget child;

  const PlainButton({
    Key key,
    this.title,
    this.titleStyle,
    this.onPressed,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      minWidth: 0.0,
      child: child ?? Text(title, style: titleStyle ?? bodyStyleBlue),
      onPressed: onPressed,
    );
  }
}
