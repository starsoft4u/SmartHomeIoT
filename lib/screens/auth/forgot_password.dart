import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/sheets/otp.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/utils/navigate.dart';
import 'package:smart_home_iot/widgets/input.dart';
import 'package:smart_home_iot/widgets/primary_button.dart';
import 'package:smart_home_iot/widgets/title_text.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const String routeName = '/forgotPassword';

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  String _email;

  void handleSheetResult(dynamic result) {
    if (result == 'valid') {
      Navigator.of(context).pushNamed('/resetPassword');
    }
  }

  void onSend() {
    showSheet(
      context,
      child: OTPSheet(
        email: _email,
        onChanged: (code) {},
        onCompleted: (code) {},
        onOkay: onOtpSubmit,
      ),
      onClose: handleSheetResult,
    );
  }

  void onOtpSubmit() {
    // valid otp
    if (true) {
      dismissModal(context, params: 'valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      backgroundImage: 'assets/bg_forgot.png',
      backgroundFit: BoxFit.fitWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TitleText('Forgot', titleBlue: 'password'),
          SizedBox(height: 8.0),
          RichText(
            text: TextSpan(
              text: 'Enter your email number below to receive your ',
              style: bodyStyle,
              children: [
                TextSpan(text: 'password reset instruction', style: bodyStyleDark),
              ],
            ),
          ),

          // Email
          SizedBox(height: 48.0),
          Input(
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

          // sign up button
          SizedBox(height: 24.0),
          PrimaryButton(
            title: 'Send',
            onPressed: onSend,
          ),
        ],
      ),
    );
  }
}
