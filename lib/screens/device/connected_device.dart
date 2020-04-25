import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/widgets/secondary_button.dart';
import 'package:smart_home_iot/widgets/sheet_container.dart';
import 'package:smart_home_iot/widgets/title_text.dart';

enum DeviceConnectionState {
  none,
  connectedToNetwork,
  connectedToDevice,
  installedExtension,
  sentMessage,
  ready,
}

// 10.6

class ConnectedDevicePage extends StatefulWidget {
  static const String routeName = '/device/connected';

  @override
  _ConnectedDevicePageState createState() => _ConnectedDevicePageState();
}

class _ConnectedDevicePageState extends State<ConnectedDevicePage> {
  @override
  Widget build(BuildContext context) {
    return CommonPage(
      title: 'Add device',
      backgroundColor: darkerColor,
      actionBarTintColor: lighterColor,
      padding: EdgeInsets.zero,
      child: SheetContainer(
        margin: EdgeInsets.zero,
        child: Column(children: <Widget>[
          SizedBox(height: 24.0),
          TitleText('Add device', titleBlue: 'successfully', fontSize: 20.0),

          //
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: RichText(
              text: TextSpan(text: 'Successfully connected the device, you can ', style: bodyStyle, children: [
                TextSpan(text: 'manage it in Device detail', style: bodyStyleDark),
              ]),
              textAlign: TextAlign.center,
            ),
          ),

          //
          SizedBox(height: 24.0),
          Image.asset('assets/result_processing.png', width: 200.0, height: 200.0, fit: BoxFit.contain),

          // device id
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Device-ID: '),
              Text('A123H47G21', style: bodyStyleDark),
            ],
          ),

          // device
          SizedBox(height: 24.0),
          Container(
            height: FORM_ELEMENT_HEIGHT,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
            ),
            child: Row(children: <Widget>[
              SvgPicture.asset('assets/device/ic_gateway.svg', color: lightTextColor),
              SizedBox(width: 8.0),
              Expanded(child: Text('My Home Gateway', style: bodyStyleDark)),
            ]),
          ),

          // save button
          Expanded(
            child: Center(
              child: SecondaryButton(
                title: 'Save device detail',
                onPressed: () => Navigator.of(context).pushNamed('/device/detail'),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
