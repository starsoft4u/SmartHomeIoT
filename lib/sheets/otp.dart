import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/widgets/secondary_button.dart';

class OTPSheet extends StatelessWidget {
  final String email;
  final void Function(String) onChanged;
  final void Function(String) onCompleted;
  final void Function() onOkay;

  const OTPSheet({
    Key key,
    this.email,
    this.onChanged,
    this.onCompleted,
    this.onOkay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(height: 8.0),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Check ', style: buttonStyleDark),
            Text('Your Inbox', style: buttonStyleBlue),
          ],
        ),
        SizedBox(height: 16.0),
        RichText(
          text: TextSpan(
            text: 'Enter the code we just send to ',
            style: bodyStyle,
            children: <TextSpan>[
              TextSpan(text: email, style: bodyStyleDark),
              TextSpan(text: ' to the box below.'),
            ],
          ),
        ),
        SizedBox(height: 24.0),
        Container(
          width: 300,
          child: PinCodeTextField(
            backgroundColor: Colors.transparent,
            activeColor: lightTextColor,
            inactiveColor: lightTextColor,
            length: 6,
            onChanged: onChanged,
            onCompleted: onCompleted,
          ),
        ),
        SizedBox(height: 64.0),
        SecondaryButton(
          title: 'Sign In',
          onPressed: onOkay,
        ),
      ],
    );
  }
}
