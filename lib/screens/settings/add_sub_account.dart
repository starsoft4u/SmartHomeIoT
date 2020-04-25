import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/utils/navigate.dart';
import 'package:smart_home_iot/utils/ui.dart';
import 'package:smart_home_iot/widgets/input.dart';
import 'package:smart_home_iot/widgets/plain_button.dart';
import 'package:smart_home_iot/widgets/secondary_button.dart';
import 'package:smart_home_iot/widgets/title_text.dart';

class AddSubAccountPage extends StatefulWidget {
  static const String routeName = '/profile/sub/add';

  @override
  _AddSubAccountPageState createState() => _AddSubAccountPageState();
}

class _AddSubAccountPageState extends State<AddSubAccountPage> {
  String _email;
  bool _showIndicator = false;

  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void handleSheetResult(dynamic result) {
    if (result == 'invite_new') {
      setState(() {
        _controller.text = '';
      });
    } else if (result == 'retry') {
      _showResult(true);
    }
  }

  void onInvite() {
    dismissKeyboard(context);

    setState(() {
      _showIndicator = true;
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _showIndicator = false;
      });

      _showResult(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      showIndicator: _showIndicator,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.crop_free),
          color: highlightTextColor,
          onPressed: () => Navigator.of(context).pushNamed('/profile/accept'),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TitleText('Add', titleBlue: 'new sub account'),
          SizedBox(height: 8.0),
          Text(
            'Enter the sub account email address of the person you want to invite to your home to use the devices together',
          ),

          // Email
          SizedBox(height: 48.0),
          Input(
            controller: _controller,
            labelText: 'Email address',
            initialValue: _email,
            prefix: SvgPicture.asset('assets/edit_email.svg'),
            keyboardType: TextInputType.emailAddress,
            onChanged: (value, isValid) {
              setState(() {
                _email = value;
              });
            },
          ),

          Expanded(child: Container()),

          // sign up button
          SecondaryButton(
            title: 'Add new sub account',
            onPressed: onInvite,
          ),
        ],
      ),
    );
  }

  void _showResult(bool success) {
    List<Widget> children = [];

    if (success) {
      children.addAll([
        // Image
        SizedBox(height: 24.0),
        Image.asset('assets/result_email_sent.png'),

        // title
        SizedBox(height: 24.0),
        TitleText('Send invitation', titleBlue: 'successful.', fontSize: 20.0),

        // message
        SizedBox(height: 24.0),
        Text('Successfully sent application invitation to the', textAlign: TextAlign.center),
        RichText(
          text: TextSpan(text: 'email address: ', style: bodyStyle, children: [
            TextSpan(text: _email, style: bodyStyleDark),
          ]),
        ),

        // invite new
        SizedBox(height: 36.0),
        SecondaryButton(
          title: 'Invite new people',
          onPressed: () => Navigator.of(context).pop('invite_new'),
        ),
      ]);
    } else {
      children.addAll([
        // Image
        SizedBox(height: 24.0),
        Image.asset('assets/result_email_receive.png'),

        // title
        SizedBox(height: 24.0),
        Text(
          'Unable to send mail at this time.',
          textAlign: TextAlign.center,
          style: bodyStyleDark.merge(t(fontSize: 20.0)),
        ),

        // message
        SizedBox(height: 24.0),
        Text(
          'Please check your internet connection and try again in a few minutes',
          textAlign: TextAlign.center,
        ),

        // try again
        SizedBox(height: 36.0),
        SecondaryButton(
          title: 'Try again',
          onPressed: () => Navigator.of(context).pop('retry'),
        ),
      ]);
    }

    // Close
    children.addAll([
      SizedBox(height: 8.0),
      Center(
        child: PlainButton(
          title: 'Close',
          titleStyle: bodyStyle.merge(t(decoration: TextDecoration.underline)),
          onPressed: () => dismissModal(context),
        ),
      ),
    ]);

    showSheet(
      context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
      onClose: handleSheetResult,
    );
  }
}
