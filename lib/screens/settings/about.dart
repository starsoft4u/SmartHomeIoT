import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/utils/navigate.dart';
import 'package:smart_home_iot/widgets/shadow_button.dart';

class AboutPage extends StatefulWidget {
  static const String routeName = '/about';

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return CommonPage(
      title: 'About Smart Home',
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      backgroundImage: 'assets/bg_splash.png',
      backgroundFit: BoxFit.cover,
      backgroundAlignment: Alignment.centerRight,
      child: Column(children: <Widget>[
        // Logo
        SvgPicture.asset(
          'assets/logo.svg',
          width: 120.0,
          height: 120.0,
          fit: BoxFit.contain,
        ),

        Expanded(flex: 2, child: Container()),

        // Terms
        ShadowButton(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Terms & Conditions', style: subTitleStyleDark),
                    SizedBox(height: 4.0),
                    Text(' '),
                  ],
                ),
              ),
              SizedBox(width: 8.0),
              Icon(Icons.chevron_right, color: darkTextColor),
            ],
          ),
          onPressed: () => _showTerms(),
        ),

        Expanded(flex: 1, child: Container()),

        // Bottom
        Text('Power by CONSAP'),
        SizedBox(height: 8.0),
        Text('v1.0'),
      ]),
    );
  }

  void _showTerms() {
    showSheet(
      context,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(height: 16.0),
          Row(children: <Widget>[
            Text('Terms and ', style: buttonStyleDark),
            Text('conditions', style: buttonStyleBlue),
          ]),
          SizedBox(height: 24.0),
          Expanded(
            child: SingleChildScrollView(
              child: Text(_terms),
            ),
          ),
        ],
      ),
    );
  }

  final _terms =
      'Before accepting the Agreement, you are supposed to thoroughly read all contents of the Agreement, and fully know its terms, especially restrictive clauses or exceptions. Restrictive clauses or exceptions are bold or highlighted in other forms to catch your attention. In case of any doubt for the terms of the Agreement, please contact relevant business department of SMART. You are not allowed to use the service before you have read and accepted all terms of the Agreement, relevant agreements and rules, etc. Once you select "agree and submit the Agreement" (see registration page for detailed wordings) and complete the registration procedure, or you use the service in any form, it will be deemed that you have read and agreed with the restriction of the Agreement and rules above. In case of any breach of the Agreement, SMART has the right to unilaterally restrict, suspend or terminate the service for you, and has the right to investigate your relevant responsibilities.';
}
