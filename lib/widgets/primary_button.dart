import 'package:flutter/material.dart';
import 'package:smart_home_iot/utils/constants.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final double height;
  final VoidCallback onPressed;
  final Widget child;

  const PrimaryButton({
    Key key,
    this.title = "Untitiled",
    this.height = FORM_ELEMENT_HEIGHT,
    this.onPressed,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle _titleStyle = buttonStyle;
    if (onPressed == null) {
      _titleStyle = _titleStyle.merge(t(color: lightTextColor));
    }

    return Container(
      constraints: BoxConstraints.expand(height: height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(height / 2.0),
        color: onPressed == null ? c(0xFFEFF0F5) : null,
        gradient: onPressed == null
            ? null
            : LinearGradient(
                colors: [c(0xFF986EFF), c(0xFF6D5CFF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
      ),
      child: MaterialButton(
        shape: StadiumBorder(),
        padding: EdgeInsets.zero,
        child: child ?? Text(title, style: _titleStyle),
        onPressed: onPressed,
      ),
    );
  }
}
