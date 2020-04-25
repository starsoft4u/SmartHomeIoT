import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_focus_watcher/flutter_focus_watcher.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/widgets/activity_indicator.dart';

class CommonPage extends StatefulWidget {
  // Actionbar
  final String title;
  final TextStyle titleStyle;
  final bool isAppBarTransparent;
  final Color actionBarColor;
  final Color actionBarTintColor;
  final Widget leading;
  final List<Widget> actions;

  // Drawer
  final Widget drawer;

  // Indicator
  final bool showIndicator;
  final bool wrapScroll;

  // Body
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final String backgroundImage;
  final BoxFit backgroundFit;
  final Alignment backgroundAlignment;
  final bool fullScreen;
  final Widget child;

  // Bottom / keyboard
  final bool resizeToAvoidBottomPadding;

  CommonPage({
    Key key,
    this.title,
    TextStyle titleStyle,
    this.isAppBarTransparent = false,
    this.actionBarColor = Colors.transparent,
    this.actionBarTintColor = darkTextColor,
    this.resizeToAvoidBottomPadding = true,
    this.leading,
    List<Widget> actions,
    this.drawer,
    this.padding = const EdgeInsets.all(24.0),
    this.showIndicator = false,
    this.wrapScroll = false,
    this.backgroundColor = pageBackgroundColor,
    this.backgroundImage,
    this.backgroundFit = BoxFit.fill,
    this.backgroundAlignment = Alignment.bottomCenter,
    this.fullScreen = false,
    @required this.child,
  })  : assert(child != null),
        titleStyle = titleStyle ?? t(color: actionBarTintColor),
        actions = actions ?? [],
        super(key: key);

  @override
  _CommonPageState createState() => _CommonPageState();
}

class _CommonPageState extends State<CommonPage> {
  double _height = 0.0;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Container(
        constraints: BoxConstraints.expand(),
        color: widget.backgroundColor,
      ),
    ];

    // background image
    if (widget.backgroundImage != null) {
      children.add(
        Container(
          constraints: BoxConstraints.expand(),
          child: Image.asset(
            widget.backgroundImage,
            fit: widget.backgroundFit,
            alignment: widget.backgroundAlignment,
          ),
        ),
      );
    }

    // app
    children.add(
      Scaffold(
        extendBodyBehindAppBar: widget.isAppBarTransparent,
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomPadding: widget.resizeToAvoidBottomPadding,
        appBar: AppBar(
          title: widget.title != null ? Text(widget.title, style: widget.titleStyle) : Container(),
          leading: widget.leading ?? (widget.isAppBarTransparent ? Container() : null),
          backgroundColor: widget.actionBarColor,
          iconTheme: IconThemeData(color: widget.actionBarTintColor),
          elevation: 0,
          toolbarOpacity: 0.75,
          actions: widget.actions,
        ),
        drawer: widget.drawer,
        body: widget.fullScreen
            ? Padding(
                padding: widget.padding,
                child: FocusWatcher(
                  child: _child(),
                ),
              )
            : SafeArea(
                child: Padding(
                  padding: widget.padding,
                  child: FocusWatcher(
                    child: _child(),
                  ),
                ),
              ),
      ),
    );

    // indicator
    if (widget.showIndicator) {
      children.add(ActivityIndicator());
    }

    // dismiss keyboard on navigation
    return WillPopScope(
      onWillPop: () async {
        FocusScope.of(context).unfocus();
        return true;
      },
      child: Stack(children: children),
    );
  }

  Widget _child() {
    if (widget.wrapScroll) {
      return LayoutBuilder(builder: (context, constraints) {
        _height = max(constraints.maxHeight, _height);

        return SingleChildScrollView(
          child: Container(
            height: _height,
            child: widget.child,
          ),
        );
      });
    } else {
      return widget.child;
    }
  }
}
