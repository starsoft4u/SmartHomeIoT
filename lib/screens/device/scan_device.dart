import 'package:flutter/material.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/widgets/plain_button.dart';
import 'package:smart_home_iot/widgets/sheet_container.dart';
import 'package:smart_home_iot/widgets/title_text.dart';

// 10.4

class ScanDevicePage extends StatefulWidget {
  static const String routeName = '/device/scan';

  @override
  _ScanDevicePageState createState() => _ScanDevicePageState();
}

class _ScanDevicePageState extends State<ScanDevicePage> {
  @override
  Widget build(BuildContext context) {
    return CommonPage(
      title: 'Add device',
      backgroundColor: darkerColor,
      actionBarTintColor: lighterColor,
      padding: EdgeInsets.zero,
      child: SheetContainer(
        margin: EdgeInsets.zero,
        child: Column(
          children: <Widget>[
            SizedBox(height: 24.0),
            TitleText('Add Gateway with', titleBlue: 'QR Code', fontSize: 20.0),

            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: RichText(
                text: TextSpan(
                  text: 'Use QR Code on the device to make installation faster for ',
                  style: bodyStyle,
                  children: [
                    TextSpan(text: 'Smart Gateway', style: bodyStyleDarkBold),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // camera
            SizedBox(height: 24.0),
            Container(
              width: 200.0,
              height: 200.0,
              color: Colors.blue,
            ),

            SizedBox(height: 32.0),
            Text('Scanning Code…', style: bodyStyleDarkBold),

            Expanded(child: Container()),
            PlainButton(
              title: 'Add manually',
              onPressed: () => Navigator.of(context).pushNamed('/device/connecting'),
            ),
          ],
        ),
      ),
    );
  }
}
