import 'package:flutter/material.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/utils/constants.dart';

class AcceptInvitePage extends StatefulWidget {
  static const String routeName = '/profile/accept';

  @override
  _AcceptInvitePageState createState() => _AcceptInvitePageState();
}

class _AcceptInvitePageState extends State<AcceptInvitePage> {
  @override
  Widget build(BuildContext context) {
    return CommonPage(
      title: 'Accept invitation by QR code',
      backgroundColor: darkTextColor,
      child: Column(
        children: <Widget>[
          Text(
            "You can accept an invitation to control devices by scanning the Main account's QR code. Ask the main account holder to invite you using a QR code.",
            style: bodyStyleWhite,
          ),

          // QR code
          SizedBox(height: 36.0),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Container(
                padding: const EdgeInsets.all(36.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Container(color: Colors.indigo),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
