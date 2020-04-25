import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/widgets/plain_button.dart';
import 'package:smart_home_iot/widgets/shadow_box.dart';
import 'package:smart_home_iot/widgets/shadow_button.dart';
import 'package:smart_home_iot/widgets/title_text.dart';

class SettingsPage extends StatefulWidget {
  static const String routeName = '/settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _email = 'tanya@gmail.com';
  bool _notificationOnOff = true;
  bool _locationOnOff = false;

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      padding: EdgeInsets.zero,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TitleText('Home', titleBlue: 'Settings'),
              ),
              SizedBox(height: 24.0),

              // Account
              ShadowBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Account', style: subTitleStyleDark),
                          SizedBox(height: 4.0),
                          _dot(_email),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.0),
                    PlainButton(
                      title: 'Sign out',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              // Notification
              ShadowBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Notification', style: subTitleStyleDark),
                          SizedBox(height: 4.0),
                          _dot(_notificationOnOff ? 'On' : 'Off'),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Switch(
                      value: _notificationOnOff,
                      onChanged: (value) {
                        setState(() {
                          _notificationOnOff = value;
                        });
                      },
                    ),
                  ],
                ),
              ),

              // Use phone location
              ShadowBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Use Phone Location', style: subTitleStyleDark),
                          SizedBox(height: 4.0),
                          _dot(_locationOnOff ? 'On' : 'Off'),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Switch(
                      value: _locationOnOff,
                      onChanged: (value) {
                        setState(() {
                          _locationOnOff = value;
                        });
                      },
                    ),
                  ],
                ),
              ),

              // Privacy policy
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
                          Text('Privacy Policy', style: subTitleStyleDark),
                          SizedBox(height: 4.0),
                          Text(' '),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Icon(Icons.chevron_right, color: darkTextColor),
                  ],
                ),
                onPressed: () => Navigator.of(context).pushNamed('/privacy'),
              ),

              // About Smart Home
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
                          Text('About Smart Home', style: subTitleStyleDark),
                          SizedBox(height: 4.0),
                          Text(' '),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Icon(Icons.chevron_right, color: darkTextColor),
                  ],
                ),
                onPressed: () => Navigator.of(context).pushNamed('/about'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dot(String label) {
    return Row(children: <Widget>[
      Container(
        width: 8.0,
        height: 8.0,
        decoration: BoxDecoration(
          color: lightTextColor,
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
      SizedBox(width: 8.0),
      Expanded(
        child: Text(label),
      ),
    ]);
  }
}
