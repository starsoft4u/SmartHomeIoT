import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/widgets/app_button.dart';
import 'package:smart_home_iot/widgets/input.dart';
import 'package:smart_home_iot/widgets/plain_button.dart';
import 'package:smart_home_iot/widgets/primary_button.dart';
import 'package:smart_home_iot/widgets/title_text.dart';

class LogInPage extends StatefulWidget {
  static const String routeName = '/login';

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  String _username;
  String _password;
  bool _showPassword = false;

  final fn1 = FocusNode();
  final fn2 = FocusNode();

  @override
  void dispose() {
    fn1.dispose();
    fn2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      wrapScroll: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TitleText('Hello', titleBlue: 'there!'),
          SizedBox(height: 8.0),
          Text('Sign in to continue'),

          SizedBox(height: 48.0),

          // Username
          Input(
            focusNode: fn1,
            nextFocus: fn2,
            labelText: 'Username',
            initialValue: _username,
            prefix: SvgPicture.asset('assets/edit_user.svg'),
            onChanged: (value, isValid) {
              setState(() {
                _username = value;
              });
            },
          ),

          // Password
          SizedBox(height: 16.0),
          Input(
            focusNode: fn2,
            labelText: 'Password',
            obscureText: !_showPassword,
            prefix: SvgPicture.asset('assets/edit_password.svg', color: lightTextColor),
            suffix: IconButton(
              icon: SvgPicture.asset(
                'assets/edit_password_${_showPassword ? 'hide' : 'show'}.svg',
                color: lightTextColor,
              ),
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
          ),

          // Forgot password
          Align(
            alignment: Alignment.centerRight,
            child: PlainButton(
              title: 'Forgot Password?',
              titleStyle: bodyStyle,
              onPressed: () => Navigator.of(context).pushNamed('/forgotPassword'),
            ),
          ),

          // login button
          SizedBox(height: 8.0),
          PrimaryButton(
            title: 'Sign In',
            onPressed: () {},
          ),

          // sign up
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Don't have an account? "),
              PlainButton(
                title: 'Sign Up',
                titleStyle: bodyStyleBlue,
                onPressed: () => Navigator.of(context).pushNamed('/register'),
              ),
            ],
          ),

          Expanded(child: Container()),
          // Google button
          AppButton(
            title: 'Continue with Google',
            titleStyle: subTitleStyle,
            icon: SvgPicture.asset('assets/ic_google.svg'),
            color: Colors.white,
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
