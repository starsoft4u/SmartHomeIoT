import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_iot/utils/constants.dart';

class SheetContainer extends StatelessWidget {
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Widget child;

  const SheetContainer({
    Key key,
    this.padding = const EdgeInsets.all(24.0),
    this.margin = EdgeInsets.zero,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: margin.add(EdgeInsets.only(top: 24.0)),
        padding: padding.add(
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        ),
        decoration: BoxDecoration(
          color: pageBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.0),
            topRight: Radius.circular(32.0),
          ),
        ),
        child: child,
      ),
    );
  }
}
