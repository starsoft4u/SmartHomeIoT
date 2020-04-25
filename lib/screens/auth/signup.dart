import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/sheets/otp.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/utils/navigate.dart';
import 'package:smart_home_iot/widgets/input.dart';
import 'package:smart_home_iot/widgets/plain_button.dart';
import 'package:smart_home_iot/widgets/primary_button.dart';
import 'package:smart_home_iot/widgets/secondary_button.dart';
import 'package:smart_home_iot/widgets/title_text.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/register';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _username;
  String _email;
  String _password;
  String _confirmPassword;

  bool _showPassword = false;
  bool _showConfirmPassword = false;
  bool _showIndicator = false;

  final fn1 = FocusNode();
  final fn2 = FocusNode();
  final fn3 = FocusNode();
  final fn4 = FocusNode();

  @override
  void dispose() {
    fn1.dispose();
    fn2.dispose();
    fn3.dispose();
    fn4.dispose();

    super.dispose();
  }

  void handleSheetResult(dynamic result) {
    if (result == 'agree') {
      setState(() {
        _showIndicator = true;
      });
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _showIndicator = false;
        });
        _showOTP();
      });
    } else if (result == 'otp') {
      _showProfile();
    } else if (result == 'profile') {
      _showComplete();
    } else if (result == 'complete') {
      Navigator.of(context).pushReplacementNamed('/home/create');
    }
  }

  void onSelectProfile() {
    // Selected one?
    if (true) {
      dismissModal(context, params: 'profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      showIndicator: _showIndicator,
      wrapScroll: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TitleText('Sign', titleBlue: 'Up'),
          SizedBox(height: 8.0),
          Text('Enter your information below to receive a one time passcode for account activation'),

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

          // Email
          SizedBox(height: 16.0),
          Input(
            focusNode: fn2,
            nextFocus: fn3,
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

          // Password
          SizedBox(height: 16.0),
          Input(
            focusNode: fn3,
            nextFocus: fn4,
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
                return 'Must be 6 characters long.';
              }
              return null;
            },
          ),

          // Confirm Password
          SizedBox(height: 16.0),
          Input(
            focusNode: fn4,
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
              if (_password != value) {
                return 'Confirm password mismatch.';
              }
              return null;
            },
          ),

          Expanded(child: Container()),

          // sign up button
          SizedBox(height: 8.0),
          PrimaryButton(
            title: 'Sing Up',
            onPressed: _showTerms,
          ),

          // log in
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Already have an account? "),
              PlainButton(
                title: 'Log In',
                onPressed: () => Navigator.of(context).pushReplacementNamed('/login'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showTerms() {
    showSheet(
      context,
      child: Column(children: <Widget>[
        SizedBox(height: 8.0),
        Row(children: <Widget>[
          Text('Terms and ', style: buttonStyleDark),
          Text('conditions', style: buttonStyleBlue),
        ]),
        SizedBox(height: 16.0),
        Expanded(
          child: SingleChildScrollView(
            child: Text(_terms),
          ),
        ),
        SizedBox(height: 24.0),
        SecondaryButton(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Accept Terms', style: buttonStyle),
              SizedBox(width: 16.0),
              Icon(Icons.check, color: Colors.white),
            ],
          ),
          onPressed: () => dismissModal(context, params: 'agree'),
        ),
        SizedBox(height: 8.0),
        PlainButton(
          title: 'Read later',
          titleStyle: bodyStyle,
          onPressed: () => dismissModal(context),
        ),
      ]),
      onClose: handleSheetResult,
    );
  }

  void _showOTP() {
    showSheet(
      context,
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: OTPSheet(
        email: _email,
        onChanged: (code) {},
        onCompleted: (code) {},
        onOkay: () {
          // valid otp
          if (true) {
            dismissModal(context, params: 'otp');
          }
        },
      ),
      onClose: handleSheetResult,
    );
  }

  void _showProfile() {
    showSheet(
      context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TitleText('Your account have been', titleBlue: 'created.', fontSize: 24.0),
          SizedBox(height: 16.0),
          Text('Please select a profile!', style: titleStyle.merge(t(fontSize: 20.0))),
          Row(children: <Widget>[
            Checkbox(
              activeColor: highlightTextColor,
              checkColor: Colors.white,
              value: false,
              onChanged: (value) {},
            ),
            Text('Master Account', style: buttonStyleDark),
          ]),
          Row(children: <Widget>[
            Checkbox(
              activeColor: highlightTextColor,
              checkColor: Colors.white,
              value: false,
              onChanged: (value) {},
            ),
            Text('Sub Account', style: buttonStyleDark),
          ]),
          SizedBox(height: 24.0),
          SecondaryButton(
            title: 'Submit',
            onPressed: onSelectProfile,
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Text(
              'Please note sub account required approval from Master Account!',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      onClose: handleSheetResult,
    );
  }

  void _showComplete() {
    showSuccessSheet(
      context,
      child: Column(children: <Widget>[
        TitleText(
          'Yassssssss! Your account have',
          titleBlue: 'been created.',
          fontSize: 24,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.0),
        Text('Start managing your home today!'),
        Expanded(child: Container()),
        PrimaryButton(
          title: 'Create your first Home',
          onPressed: () => Navigator.of(context).pop('complete'),
        ),
        Expanded(child: Container()),
      ]),
      onClose: handleSheetResult,
    );
  }

  final _terms =
      'Before accepting the Agreement, you are supposed to thoroughly read all contents of the Agreement, and fully know its terms, especially restrictive clauses or exceptions. Restrictive clauses or exceptions are bold or highlighted in other forms to catch your attention. In case of any doubt for the terms of the Agreement, please contact relevant business department of SMART. You are not allowed to use the service before you have read and accepted all terms of the Agreement, relevant agreements and rules, etc. Once you select "agree and submit the Agreement" (see registration page for detailed wordings) and complete the registration procedure, or you use the service in any form, it will be deemed that you have read and agreed with the restriction of the Agreement and rules above. In case of any breach of the Agreement, SMART has the right to unilaterally restrict, suspend or terminate the service for you, and has the right to investigate your relevant responsibilities.';
}
