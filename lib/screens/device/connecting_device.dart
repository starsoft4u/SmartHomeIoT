import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/widgets/sheet_container.dart';
import 'package:smart_home_iot/widgets/title_text.dart';

enum ConnectStatus {
  none,
  connectedToNetwork,
  connectedToDevice,
  installedExtension,
  sentMessage,
  ready,
}

// 10.5

class ConnectingDevicePage extends StatefulWidget {
  static const String routeName = '/device/connecting';

  @override
  _ConnectingDevicePageState createState() => _ConnectingDevicePageState();
}

class _ConnectingDevicePageState extends State<ConnectingDevicePage> {
  ConnectStatus _connectStatus = ConnectStatus.none;

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 1), (timer) {
      switch (_connectStatus) {
        case ConnectStatus.none:
          {
            setState(() {
              _connectStatus = ConnectStatus.connectedToNetwork;
            });
          }
          break;

        case ConnectStatus.connectedToNetwork:
          {
            setState(() {
              _connectStatus = ConnectStatus.connectedToDevice;
            });
          }
          break;

        case ConnectStatus.connectedToDevice:
          {
            setState(() {
              _connectStatus = ConnectStatus.installedExtension;
            });
          }
          break;

        case ConnectStatus.installedExtension:
          {
            setState(() {
              _connectStatus = ConnectStatus.sentMessage;
            });
          }
          break;

        case ConnectStatus.sentMessage:
          {
            setState(() {
              _connectStatus = ConnectStatus.ready;
            });
          }
          break;

        default:
          {
            timer.cancel();
            Navigator.of(context).pushReplacementNamed('/device/connected');
          }
          break;
      }
    });
  }

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
            TitleText('Adding', titleBlue: 'Gateway', fontSize: 20.0),

            //
            SizedBox(height: 16.0),
            Text(
              'Please wait, the system is connecting to the new device, this may take a few seconds',
              textAlign: TextAlign.center,
            ),

            //
            SizedBox(height: 24.0),
            Image.asset('assets/result_processing.png', width: 200.0, height: 200.0, fit: BoxFit.contain),

            // info
            Expanded(
              child: _connecting(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _connecting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Connected to network
        SizedBox(height: 8.0),
        Row(children: <Widget>[
          (_connectStatus == ConnectStatus.none || _connectStatus == ConnectStatus.connectedToNetwork)
              ? Icon(Icons.radio_button_unchecked, color: lightTextColor, size: 16.0)
              : Icon(Icons.check, color: successColor, size: 16.0),
          SizedBox(width: 8.0),
          Text(
            'Connected to network',
            style: (_connectStatus == ConnectStatus.none || _connectStatus == ConnectStatus.connectedToNetwork)
                ? bodyStyle
                : bodyStyleDark,
          ),
        ]),

        // Device connected
        SizedBox(height: 8.0),
        Row(children: <Widget>[
          (_connectStatus == ConnectStatus.installedExtension ||
                  _connectStatus == ConnectStatus.sentMessage ||
                  _connectStatus == ConnectStatus.ready)
              ? Icon(Icons.check, color: successColor, size: 16.0)
              : Icon(Icons.radio_button_unchecked, color: lightTextColor, size: 16.0),
          SizedBox(width: 8.0),
          Text(
            'Device connected',
            style: (_connectStatus == ConnectStatus.installedExtension ||
                    _connectStatus == ConnectStatus.sentMessage ||
                    _connectStatus == ConnectStatus.ready)
                ? bodyStyleDark
                : bodyStyle,
          ),
        ]),

        // Extension installed
        SizedBox(height: 8.0),
        Row(children: <Widget>[
          (_connectStatus == ConnectStatus.sentMessage || _connectStatus == ConnectStatus.ready)
              ? Icon(Icons.check, color: successColor, size: 16.0)
              : Icon(Icons.radio_button_unchecked, color: lightTextColor, size: 16.0),
          SizedBox(width: 8.0),
          Text(
            'Extention installed',
            style: (_connectStatus == ConnectStatus.sentMessage || _connectStatus == ConnectStatus.ready)
                ? bodyStyleDark
                : bodyStyle,
          ),
        ]),

        // Message sent to devices
        SizedBox(height: 8.0),
        Row(children: <Widget>[
          (_connectStatus == ConnectStatus.ready)
              ? Icon(Icons.check, color: successColor, size: 16.0)
              : Icon(Icons.radio_button_unchecked, color: lightTextColor, size: 16.0),
          SizedBox(width: 8.0),
          Text(
            'Message sent to devices',
            style: (_connectStatus == ConnectStatus.ready) ? bodyStyleDark : bodyStyle,
          ),
        ]),

        // progress
        Expanded(
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(c(0xFF707070)),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
