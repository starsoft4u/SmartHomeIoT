import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_home_iot/screens/Common.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/widgets/input.dart';
import 'package:smart_home_iot/widgets/primary_button.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _username;
  String _email;
  String _phoneNumber;

  final fn1 = FocusNode();
  final fn2 = FocusNode();
  final fn3 = FocusNode();

  @override
  void dispose() {
    fn1.dispose();
    fn2.dispose();
    fn3.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      backgroundImage: 'assets/bg_profile.png',
      backgroundFit: BoxFit.none,
      backgroundAlignment: Alignment.center,
      wrapScroll: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RichText(
            text: TextSpan(text: 'My ', style: titleStyle.merge(t(color: darkTextColor)), children: [
              TextSpan(text: 'Profile', style: titleStyle.merge(t(color: Colors.white))),
            ]),
          ),
          SizedBox(height: 8.0),
          Text('Update account information', style: bodyStyleWhite),

          // Avatar
          Expanded(
            child: Center(
              child: Container(
                width: 160.0,
                height: 160.0,
                child: Stack(children: <Widget>[
                  Positioned.fill(
                    child: CircleAvatar(
                      backgroundColor: c(0xFF5A537B),
                    ),
                  ),
                  Positioned(
                    right: 8.0,
                    bottom: 8.0,
                    width: 36.0,
                    height: 36.0,
                    child: MaterialButton(
                      color: successColor,
                      shape: CircleBorder(),
                      padding: EdgeInsets.zero,
                      elevation: 1.0,
                      highlightElevation: 1.0,
                      child: SvgPicture.asset('assets/ic_edit.svg', color: Colors.white),
                      onPressed: () {},
                    ),
                  )
                ]),
              ),
            ),
          ),

          // account
          Input(
            focusNode: fn1,
            nextFocus: fn2,
            labelText: 'Username',
            initialValue: _username,
            prefix: SvgPicture.asset('assets/edit_account.svg'),
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

          // Phone number
          SizedBox(height: 16.0),
          Input(
            focusNode: fn3,
            labelText: 'Phone number',
            initialValue: _phoneNumber,
            prefix: SvgPicture.asset('assets/edit_phone.svg'),
            keyboardType: TextInputType.phone,
            onChanged: (value, isValid) {
              setState(() {
                _phoneNumber = value;
              });
            },
          ),

          // Update
          SizedBox(height: 36.0),
          PrimaryButton(
            title: 'Update',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
