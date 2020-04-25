import 'package:flutter/material.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/widgets/secondary_button.dart';

class RemoveSubAccountPage extends StatefulWidget {
  static const String routeName = '/profile/sub/remove';

  @override
  _RemoveSubAccountPageState createState() => _RemoveSubAccountPageState();
}

class _RemoveSubAccountPageState extends State<RemoveSubAccountPage> {
  @override
  Widget build(BuildContext context) {
    return CommonPage(
      title: 'Remove sub account',
      backgroundColor: darkerColor,
      actionBarTintColor: lighterColor,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Image.asset('assets/result_accounts.png', fit: BoxFit.contain),
            ),
          ),
          RichText(
            text: TextSpan(text: 'Are you ', style: buttonStyleBlue.merge(t(fontSize: 20.0)), children: [
              TextSpan(text: 'sure?', style: buttonStyle.merge(t(fontSize: 20.0))),
            ]),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'You sub account will lost all the data and settings if you remove their access to this home. And they will no longer has access to this home. ',
              textAlign: TextAlign.center,
              style: bodyStyle.merge(t(color: c(0xFFE3DFFF))),
            ),
          ),
          Expanded(flex: 2, child: Container()),

          // buttons
          SecondaryButton(
            title: 'Yes, confirm remove!',
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          MaterialButton(
            child: Text('Cancel', style: t(color: c(0xFF5A537B), decoration: TextDecoration.underline)),
            padding: const EdgeInsets.all(8.0),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
