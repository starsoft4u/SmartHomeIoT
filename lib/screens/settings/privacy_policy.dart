import 'package:flutter/material.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/utils/constants.dart';

class PrivacyPolicyPage extends StatefulWidget {
  static const String routeName = '/privacy';

  @override
  _PrivacyPolicyPageState createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  @override
  Widget build(BuildContext context) {
    return CommonPage(
      title: 'Privacy Policy',
      padding: EdgeInsets.zero,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(_privacy),
        ),
      ),
    );
  }

  final _privacy =
      '''Before accepting the Agreement, you are supposed to thoroughly read all contents of the Agreement, and fully know its terms, especially restrictive clauses or exceptions. 

Restrictive clauses or exceptions are bold or highlighted in other forms to catch your attention. In case of any doubt for the terms of the Agreement, please contact relevant business department of SMART. You are not allowed to use the service before you have read and accepted all terms of the Agreement, relevant agreements and rules, etc. 

Once you select "agree and submit the Agreement" (see registration page for detailed wordings) and complete the registration procedure, or you use the service in any form, it will be deemed that you have read and agreed with the restriction of the Agreement and rules above. 

In case of any breach of the Agreement, SMART has the right to unilaterally restrict, suspend or terminate the service for you, and has the right to investigate your relevant responsibilities.''';
}
