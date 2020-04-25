import 'package:flutter/material.dart';

void dismissKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(new FocusNode());
}
