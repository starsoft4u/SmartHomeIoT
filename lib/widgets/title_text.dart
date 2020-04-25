import 'package:flutter/material.dart';
import 'package:smart_home_iot/utils/constants.dart';

class TitleText extends StatelessWidget {
  final String title;
  final String titleBlue;
  final TextAlign textAlign;
  final double fontSize;

  const TitleText(
    this.title, {
    Key key,
    this.titleBlue,
    this.textAlign = TextAlign.start,
    this.fontSize = 32.0,
  })  : assert(title != null && title.length > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (titleBlue != null && titleBlue.isNotEmpty) {
      return RichText(
        text: TextSpan(
          text: '$title ',
          style: titleStyle.merge(t(fontSize: fontSize)),
          children: [
            TextSpan(
              text: titleBlue,
              style: titleStyleBlue.merge(t(fontSize: fontSize)),
            )
          ],
        ),
        textAlign: textAlign,
      );
    } else {
      return Text(
        title,
        textAlign: textAlign,
        style: titleStyle.merge(t(fontSize: fontSize)),
      );
    }
  }
}
