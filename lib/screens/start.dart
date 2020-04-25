import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/widgets/app_button.dart';
import 'package:smart_home_iot/widgets/plain_button.dart';

class StartPage extends StatefulWidget {
  static const String routeName = '/start';

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return CommonPage(
      isAppBarTransparent: true,
      backgroundImage: 'assets/bg_start.png',
      backgroundFit: BoxFit.fitHeight,
      padding: const EdgeInsets.fromLTRB(24.0, 36.0, 24.0, 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('Hello', style: buttonStyle.merge(t(fontSize: 36.0))),
          Text('there!', style: buttonStyle.merge(t(fontSize: 60.0))),
          Expanded(child: Container()),
          AppButton(
            title: 'Continue with Google',
            titleStyle: subTitleStyle,
            icon: SvgPicture.asset('assets/ic_google.svg'),
            color: Colors.white,
            onPressed: () {},
          ),
          SizedBox(height: 20.0),
          Row(children: <Widget>[
            SizedBox(width: 64.0),
            Expanded(
              child: Container(height: 1, color: lightTextColor),
            ),
            SizedBox(width: 24.0),
            Text('or', style: t(fontSize: 17.0, color: Colors.white)),
            SizedBox(width: 24.0),
            Expanded(
              child: Container(height: 1, color: lightTextColor),
            ),
            SizedBox(width: 64.0),
          ]),
          SizedBox(height: 20.0),
          AppButton(
            title: 'SIGN UP',
            color: Colors.black.withAlpha(198),
            onPressed: () => Navigator.of(context).pushNamed('/register'),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Already have an account? ', style: bodyStyleWhite),
              PlainButton(
                title: 'Sign In',
                titleStyle: bodyStyleWhite.merge(t(decoration: TextDecoration.underline)),
                onPressed: () => Navigator.of(context).pushNamed('/login'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
