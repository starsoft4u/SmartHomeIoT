import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/utils/navigate.dart';
import 'package:smart_home_iot/widgets/app_button.dart';
import 'package:smart_home_iot/widgets/input.dart';
import 'package:smart_home_iot/widgets/primary_button.dart';
import 'package:smart_home_iot/widgets/title_text.dart';

class ResetPasswordPage extends StatefulWidget {
  static const String routeName = '/resetPassword';

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  String _password;
  String _confirmPassword;

  bool _showPassword = false;
  bool _showConfirmPassword = false;

  final fn1 = FocusNode();
  final fn2 = FocusNode();

  @override
  void dispose() {
    fn1.dispose();
    fn2.dispose();

    super.dispose();
  }

  void handleSheetResult(dynamic result) {}

  void resetPassword() {
    // reset success
    if (true) {
      showSuccess();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TitleText('Create new', titleBlue: 'Password'),

          // Password
          SizedBox(height: 48.0),
          Input(
            focusNode: fn1,
            nextFocus: fn2,
            labelText: 'Password',
            obscureText: !_showPassword,
            prefix: SvgPicture.asset('assets/edit_password.svg'),
            suffix: IconButton(
              icon: SvgPicture.asset('assets/edit_password_${_showPassword ? 'hide' : 'show'}.svg'),
              onPressed: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
            ),
            initialValue: _password,
            onChanged: (value, isValid) {
              setState(() {
                _password = value;
              });
            },
            validator: (value) {
              if (value.length < 6) {
                return 'Password must be at least 6 characters long.';
              }
              return null;
            },
          ),

          // Confirm Password
          SizedBox(height: 16.0),
          Input(
            focusNode: fn2,
            labelText: 'Confirm password',
            obscureText: !_showConfirmPassword,
            prefix: SvgPicture.asset('assets/edit_password.svg'),
            suffix: IconButton(
              icon: SvgPicture.asset('assets/edit_password_${_showConfirmPassword ? 'hide' : 'show'}.svg'),
              onPressed: () {
                setState(() {
                  _showConfirmPassword = !_showConfirmPassword;
                });
              },
            ),
            initialValue: _confirmPassword,
            onChanged: (value, isValid) {
              setState(() {
                _confirmPassword = value;
              });
            },
            validator: (value) {
              if (_password != _confirmPassword) {
                return 'Confirm password mismatch.';
              }
              return null;
            },
          ),

          SizedBox(height: 24.0),
          Text('Please do not enter a strong password.'),

          // sign up button
          Expanded(child: Container()),
          PrimaryButton(
            title: 'Create Password',
            onPressed: resetPassword,
          ),
        ],
      ),
    );
  }

  void showSuccess() {
    showSheet(
      context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset('assets/result_success.png', width: 160.0, height: 140.0, fit: BoxFit.contain),
          SizedBox(height: 24.0),
          Text('Your password', style: buttonStyleDark),
          Text('have been reset.', style: buttonStyleDark),
          SizedBox(height: 16.0),
          Text('You can login with the new password now!'),
          SizedBox(height: 48.0),
          AppButton(
            title: 'Login',
            color: darkColor,
            onPressed: () => dismissModal(context),
          ),
        ],
      ),
      onClose: handleSheetResult,
    );
  }
}
