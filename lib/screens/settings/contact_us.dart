import 'package:flutter/material.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/utils/navigate.dart';
import 'package:smart_home_iot/widgets/primary_button.dart';
import 'package:smart_home_iot/widgets/secondary_button.dart';
import 'package:smart_home_iot/widgets/title_text.dart';

class ContactUsPage extends StatefulWidget {
  static const String routeName = '/contactUs';

  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  bool _showIndicator = false;

  void onSend() {
    setState(() {
      _showIndicator = true;
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _showIndicator = false;
      });

      _showResult();
    });
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: Colors.white),
    );

    return CommonPage(
      title: 'Contact us',
      wrapScroll: true,
      showIndicator: _showIndicator,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TitleText('Send', titleBlue: 'Feedback or Comment'),
          SizedBox(height: 24.0),
          Text('You can send us any feedback, comment or report any issue.'),
          Expanded(child: Container()),
          TextField(
            decoration: InputDecoration(
              border: border,
              focusedBorder: border,
              disabledBorder: border,
              enabledBorder: border,
              errorBorder: border,
              focusedErrorBorder: border,
              filled: true,
              fillColor: Colors.white,
              hintText: 'Your message here…',
              hintStyle: bodyStyle,
            ),
            style: bodyStyleDark,
            maxLines: 10,
          ),
          SizedBox(height: 4.0),
          Text('maximum 200 words', style: captionStyle),
          Expanded(child: Container()),
          Text('We will try our best to reply to your email as soon as possible. Thanks for your understanding.'),
          SizedBox(height: 24.0),
          PrimaryButton(
            title: 'Send',
            onPressed: onSend,
          ),
        ],
      ),
    );
  }

  void _showResult() {
    showSheet(
      context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image
          SizedBox(height: 24.0),
          Image.asset('assets/result_email_sent.png'),

          // title
          SizedBox(height: 24.0),
          TitleText('Send', titleBlue: 'successful.', fontSize: 20.0),

          // message
          SizedBox(height: 24.0),
          Text('Successfully sent feedback or comment.', textAlign: TextAlign.center),

          // invite new
          SizedBox(height: 36.0),
          SecondaryButton(
            title: 'Close',
            onPressed: () => Navigator.of(context).pop(),
          ),
          SizedBox(height: 36.0),
        ],
      ),
    );
  }
}
