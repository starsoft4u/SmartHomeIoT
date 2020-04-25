import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/utils/navigate.dart';
import 'package:smart_home_iot/widgets/plain_button.dart';
import 'package:smart_home_iot/widgets/secondary_button.dart';
import 'package:smart_home_iot/widgets/shadow_box.dart';
import 'package:smart_home_iot/widgets/title_text.dart';

class SubAccountsPage extends StatefulWidget {
  static const String routeName = '/profile/sub';

  @override
  _SubAccountsPageState createState() => _SubAccountsPageState();
}

class _SubAccountsPageState extends State<SubAccountsPage> {
  UserData _mainAccount = UserData(name: 'Samuel Chan', email: 'samuel@consap.sg');
  List<UserData> _subAccounts = [
    UserData(name: 'Tanya', email: 'tanya@gmail.com'),
  ];

  void handleSheetResult(dynamic result) {
    if (result == 'add_sub_account') {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      backgroundImage: 'assets/bg_splash.png',
      backgroundFit: BoxFit.cover,
      backgroundAlignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text('Members', style: titleStyle),
          ),
          SizedBox(height: 24.0),

          // Main account
          _categoryView('Main Account'),
          ShadowBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(_mainAccount.name, style: buttonStyleDark),
                SizedBox(height: 8.0),
                Text(_mainAccount.email, style: captionStyle),
              ],
            ),
          ),

          // Sub account
          SizedBox(height: 24.0),
          _categoryView('Sub Account'),
          Expanded(
            child: ListView.builder(
              itemCount: _subAccounts.length,
              itemBuilder: (context, index) => _accountItem(index),
            ),
          ),

          // add button
          SizedBox(height: 24.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SecondaryButton(
              title: 'Add sub account',
              onPressed: () => _showSubAccountSheet(),
            ),
          ),

          // accept button
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SecondaryButton(
              title: 'Accept invitation by QR code',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryView(String title) {
    final width = MediaQuery.of(context).size.width - 24.0 * 2;
    final height = 28.0;

    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      width: width,
      height: height,
      child: Stack(children: <Widget>[
        // Dashed line
        Positioned(
          left: 2.0,
          right: 2.0,
          top: height / 2.0,
          height: 1.0,
          child: DottedBorder(
            dashPattern: [6, 4],
            color: lightTextColor,
            child: Container(),
            customPath: (size) => Path()
              ..moveTo(0, 0.5)
              ..lineTo(size.width, 0.5),
          ),
        ),

        // Left oval
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 16.0,
            height: 16.0,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: lightTextColor),
          ),
        ),

        // Right oval
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 16.0,
            height: 16.0,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: lightTextColor),
          ),
        ),

        // Label
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 160.0,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(height / 2.0),
              color: darkColor,
            ),
            child: Center(child: Text(title, style: buttonStyle.merge(t(fontSize: 12.0)))),
          ),
        ),
      ]),
    );
  }

  Widget _accountItem(int index) {
    final account = _subAccounts[index];

    return ShadowBox(
      padding: const EdgeInsets.only(left: 24.0, right: 16.0, bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(account.name, style: buttonStyleDark),
              ),
              SizedBox(width: 8.0),
              IconButton(
                icon: SvgPicture.asset('assets/ic_delete.svg', color: errorColor),
                onPressed: () => Navigator.of(context).pushNamed('/profile/sub/remove'),
              ),
            ],
          ),
          Text(account.email, style: captionStyle),
        ],
      ),
    );
  }

  void _showSubAccountSheet() {
    showSheet(
      context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Title
          SizedBox(height: 24.0),
          TitleText('Add', titleBlue: 'new sub account', fontSize: 20.0),

          // Description
          SizedBox(height: 16.0),
          Text('Add sub account to your home to use the devices '),
          RichText(
            text: TextSpan(text: 'together. ', style: bodyStyle, children: [
              TextSpan(text: 'Scan the QR code below to continue', style: bodyStyleDark),
            ]),
          ),

          // QR code
          SizedBox(height: 24.0),
          Container(
            color: Colors.indigo,
            width: 160.0,
            height: 160.0,
            child: Stack(children: <Widget>[]),
          ),

          // id
          SizedBox(height: 24.0),
          Text('ID: 8DFS8D7FASIN', style: bodyStyleDarkBold),

          // button
          SizedBox(height: 48.0),
          PlainButton(
            title: 'Add manually',
            onPressed: () => Navigator.of(context).pushNamed('/profile/sub/add'),
          ),
        ],
      ),
    );
  }
}

class UserData {
  final String name;
  final String email;

  UserData({
    this.name,
    this.email,
  });
}
