import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/widgets/shadow_button.dart';

class HelpPage extends StatefulWidget {
  static const String routeName = '/help';

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return CommonPage(
      title: 'How to use',
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: ListView(children: <Widget>[
        _menuItem(
          title: 'Invite sub account',
          date: '08/04/2020',
          onPressed: () {},
        ),
        _menuItem(
          title: 'Add new device',
          date: '06/04/2020',
          onPressed: () {},
        ),
      ]),
    );
  }

  Widget _menuItem({String title, String date, void Function() onPressed}) {
    return ShadowButton(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(children: [
        SvgPicture.asset('assets/ic_info.svg'),
        Container(
          width: 1.0,
          height: 72.0,
          margin: const EdgeInsets.only(left: 8.0, right: 16.0),
          color: lightColor,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(title, style: bodyStyleDarkBold),
              SizedBox(height: 4.0),
              Text(date, style: bodyStyle),
            ],
          ),
        ),
        SizedBox(width: 8.0),
        Icon(Icons.chevron_right, color: darkTextColor),
      ]),
      onPressed: onPressed,
    );
  }
}
