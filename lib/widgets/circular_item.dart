import 'package:flutter/material.dart';
import 'package:smart_home_iot/utils/constants.dart';

class CircularItem extends StatefulWidget {
  final String title;
  final double width;
  final Color backgroundColor;
  final Color selectedColor;
  final bool isSelected;
  final void Function() onPressed;
  final Widget child;

  const CircularItem({
    Key key,
    this.title,
    this.width,
    this.backgroundColor = Colors.white,
    this.selectedColor = highlightTextColor,
    this.isSelected = false,
    this.onPressed,
    this.child,
  }) : super(key: key);

  @override
  _CircularItemState createState() => _CircularItemState();
}

class _CircularItemState extends State<CircularItem> {
  @override
  Widget build(BuildContext context) {
    final width = widget.width ?? (MediaQuery.of(context).size.width - 24.0 * 5) / 4.0;

    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 4.0),
            Container(
              width: width - 8.0,
              height: width - 8.0,
              decoration: BoxDecoration(
                border: widget.isSelected ? Border.all(color: widget.selectedColor, width: 2.0) : null,
                borderRadius: BorderRadius.circular((width - 8.0) / 2.0),
                boxShadow: [
                  BoxShadow(color: c(0xFF20000000), blurRadius: 6.0, offset: Offset(0, 0), spreadRadius: 4.0)
                ],
              ),
              child: CircleAvatar(
                child: widget.child,
                backgroundColor: widget.backgroundColor,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: captionStyle.merge(t(color: darkTextColor)),
            ),
          ],
        ),
      ),
    );
  }
}
