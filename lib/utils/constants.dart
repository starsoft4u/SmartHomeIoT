import 'package:flutter/material.dart';

const double FORM_ELEMENT_HEIGHT = 48.0;

mixin ToColorAlias {}

class c = Color with ToColorAlias;

const pageBackgroundColor = Color(0xFFF6F7FB);
const darkTextColor = Color(0xFF051D3F);
const lightTextColor = Color(0xFFA1AFC3);
const highlightTextColor = Color(0xFF7C42FF);
const errorColor = Color(0xFFD70D5A);
const successColor = Color(0xFF00CC96);
const lightColor = Color(0xFFE0E0E1);
const lighterColor = Color(0xFFFBFAFF);
const darkColor = Color(0xFF3F3A58);
const darkerColor = Color(0xFF0B0914);

mixin ToTextStyleAlias {}

class t = TextStyle with ToTextStyleAlias;

const titleStyle = TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: darkTextColor);
const titleStyleBlue = TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: highlightTextColor);

const subTitleStyle = TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: lightTextColor);
const subTitleStyleDark = TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: darkTextColor);

const buttonStyle = TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white);
const buttonStyleDark = TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: darkTextColor);
const buttonStyleBlue = TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: highlightTextColor);

const bodyStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: lightTextColor);
const bodyStyleDark = TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: darkTextColor);
const bodyStyleBlue = TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: highlightTextColor);
const bodyStyleWhite = TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white);

const bodyStyleBold = TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white);
const bodyStyleDarkBold = TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: darkTextColor);

const captionStyle = TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: lightTextColor);
