import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home_iot/screens/Common.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool navigated = false;

  @override
  Widget build(BuildContext context) {
    if (!navigated) {
      Future.delayed(Duration(seconds: 3), () => Navigator.of(context).pushReplacementNamed('/intro'));
      navigated = true;
    }

    return CommonPage(
      isAppBarTransparent: true,
      backgroundImage: 'assets/bg_splash.png',
      backgroundFit: BoxFit.cover,
      backgroundAlignment: Alignment.centerRight,
      child: Stack(children: <Widget>[
        Center(
          child: SvgPicture.asset(
            'assets/logo.svg',
            width: 120.0,
            height: 120.0,
            fit: BoxFit.contain,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text('Power by CONSAP'),
        ),
      ]),
    );
  }
}
