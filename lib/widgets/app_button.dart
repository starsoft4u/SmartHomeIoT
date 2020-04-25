import 'package:flutter/material.dart';
import 'package:smart_home_iot/utils/constants.dart';

class AppButton extends StatelessWidget {
  final String title;
  final TextStyle titleStyle;
  final Widget icon;
  final Color color;
  final double height;
  final VoidCallback onPressed;

  const AppButton({
    Key key,
    this.title = "Untitiled",
    this.titleStyle,
    this.icon,
    this.color,
    this.height = FORM_ELEMENT_HEIGHT,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle _titleStyle = buttonStyle.merge(titleStyle);
    if (onPressed == null) {
      _titleStyle = _titleStyle.merge(t(color: lightTextColor));
    }

    List<Widget> items = [
      Container(
        height: height,
        child: Center(
          child: Text(title, style: _titleStyle),
        ),
      )
    ];

    if (icon != null) {
      items.insert(
        0,
        Positioned(
          left: 16.0,
          top: (height - 24.0) / 2.0,
          child: icon,
        ),
      );
    }

    return MaterialButton(
      color: onPressed == null ? c(0xFFEFF0F5) : color,
      elevation: 0.5,
      highlightElevation: 0.5,
      shape: StadiumBorder(),
      child: Stack(children: items),
      onPressed: onPressed,
    );
  }
}
