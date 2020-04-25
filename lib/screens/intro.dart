import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/sheets/permission.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/utils/navigate.dart';
import 'package:smart_home_iot/widgets/app_button.dart';

class IntroPage extends StatefulWidget {
  static const String routeName = '/intro';

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int currentIndex = 0;
  bool _grantedCamera = false;
  bool _grantedPhotoLibrary = false;
  bool _grantedNotification = false;
  bool _grantedLocation = false;

  bool get isAllGranted {
    return _grantedCamera && _grantedPhotoLibrary && _grantedNotification && _grantedLocation;
  }

  void handleSheetResult(dynamic result) {
    if (result == 'allGranted') {
      Navigator.of(context).pushReplacementNamed('/start');
    }
  }

  void onStart() {
    if (isAllGranted) {
      Navigator.of(context).pushReplacementNamed('/start');
    } else {
      showSheet(
        context,
        padding: EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0, bottom: 48.0),
        child: PermissionSheet(
          onChanged: (camera, photoLibrary, notification, location) {
            _grantedCamera = camera;
            _grantedPhotoLibrary = photoLibrary;
            _grantedNotification = notification;
            _grantedLocation = location;

            if (isAllGranted) {
              dismissModal(context, params: 'allGranted');
            }
          },
        ),
        onClose: handleSheetResult,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      isAppBarTransparent: true,
      padding: EdgeInsets.zero,
      fullScreen: true,
      child: Stack(children: <Widget>[
        slider(),
        dotIndicator(),
        startButton(context),
      ]),
    );
  }

  Widget dotIndicator() {
    return Padding(
      padding: EdgeInsets.only(top: 180),
      child: Center(
        child: DotsIndicator(
          dotsCount: _introTitles.length,
          position: currentIndex.toDouble(),
          decorator: DotsDecorator(
            spacing: EdgeInsets.all(3.0),
            size: const Size.square(4.0),
            color: c(0xffE0E0E1),
            activeSize: const Size(20.0, 4.0),
            activeColor: c(0xff7C42FF),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
          ),
        ),
      ),
    );
  }

  Widget startButton(BuildContext context) {
    return Positioned(
      left: 24.0,
      right: 24.0,
      bottom: 48.0,
      child: AppButton(
        title: "Get started",
        color: c(0xFF342B73),
        onPressed: onStart,
      ),
    );
  }

  Widget slider() {
    return Swiper(
      itemBuilder: intro,
      itemCount: _introTitles.length,
      loop: false,
      onIndexChanged: (index) {
        setState(() {
          currentIndex = index;
        });
      },
    );
  }

  Widget intro(BuildContext context, int index) {
    final screenWidth = MediaQuery.of(context).size.width;
    final offset = -screenWidth * index;

    return Stack(children: <Widget>[
      // wave background
      Positioned(
        top: 0,
        bottom: 0,
        left: offset,
        right: 0,
        child: Image.asset(
          'assets/bg_intro.png',
          fit: BoxFit.fitHeight,
          alignment: Alignment.bottomLeft,
        ),
      ),
      Column(children: <Widget>[
        SizedBox(height: 48.0),
        // image
        Expanded(
          child: Image.asset('assets/intro$index.png', fit: BoxFit.contain),
        ),
        SizedBox(height: 24.0),
        Column(children: <Widget>[
          // title
          Text(_introTitles[index], style: buttonStyleDark),
          SizedBox(height: 8.0),
          // description
          Text(_introDescs[index], textAlign: TextAlign.center),
        ]),
        Expanded(child: Container()),
      ]),
    ]);
  }

  final _introTitles = [
    'SMART HOME',
    'SMART LIVING',
    'BE SMART',
  ];
  final _introDescs = [
    'Join the modern life with oursuper smart home app',
    'Manage all the compatible smart devicesfrom a single app in the palm of your hand.',
    'Lower your utility bill and make life easierwith smart alert of utility consumption.',
  ];
}
