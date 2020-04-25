import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home_iot/utils/constants.dart';

class ActivityIndicator extends StatefulWidget {
  const ActivityIndicator({Key key}) : super(key: key);

  @override
  _ActivityIndicatorState createState() => _ActivityIndicatorState();
}

class _ActivityIndicatorState extends State<ActivityIndicator> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: Duration(milliseconds: 2000), vsync: this);
    animation = Tween<double>(
      begin: 50.0,
      end: 100.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );
    controller.repeat();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: _buildAnimation,
    );
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      color: c(0x80051D3F),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Container(
            color: Colors.white,
            width: 100.0,
            height: 100.0,
            child: Stack(children: <Widget>[
              Align(
                alignment: Alignment(0, -0.5),
                child: SvgPicture.asset(
                  'assets/ic_loading_icon.svg',
                  width: 64.0,
                  height: 64.0,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 10.0,
                top: animation.value,
                width: 80.0,
                height: 40.0,
                child: SvgPicture.asset(
                  'assets/ic_loading_arrow.svg',
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
