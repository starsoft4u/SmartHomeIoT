import 'package:flutter/material.dart';
import 'package:smart_home_iot/widgets/sheet_container.dart';

void dismissModal(BuildContext context, {dynamic params}) {
  if (params != null) {
    Navigator.of(context).pop(params);
  } else {
    Navigator.of(context).popUntil((route) => route.settings.name != null);
  }
}

void showSheet(
  BuildContext context, {
  bool dismissPreviousSheet = true,
  EdgeInsets padding = const EdgeInsets.all(24.0),
  Widget child,
  void Function(dynamic) onClose,
}) {
  if (dismissPreviousSheet) {
    dismissModal(context);
  }

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => SheetContainer(padding: padding, child: child),
  ).then((result) {
    if (onClose != null) {
      onClose(result);
    }
  });
}

void showSuccessSheet(
  BuildContext context, {
  bool dismissPreviousSheet = true,
  Widget child,
  void Function(dynamic) onClose,
}) {
  if (dismissPreviousSheet) {
    dismissModal(context);
  }

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    backgroundColor: Colors.transparent,
    builder: (context) => LayoutBuilder(builder: (context, constraint) {
      return Stack(children: <Widget>[
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: constraint.maxHeight / 2,
          child: SheetContainer(
            padding: const EdgeInsets.fromLTRB(24.0, 64.0, 24.0, 24.0),
            child: child,
          ),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: Image.asset(
              'assets/ani_check.png',
              width: 200.0,
              height: 200.0,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ]);
    }),
  ).then((result) {
    if (onClose != null) {
      onClose(result);
    }
  });
}
