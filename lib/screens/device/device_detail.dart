import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/widgets/input.dart';
import 'package:smart_home_iot/widgets/plain_button.dart';
import 'package:smart_home_iot/widgets/secondary_button.dart';
import 'package:smart_home_iot/widgets/sheet_container.dart';

// 10.7, 10.9

class DeviceDetailPage extends StatefulWidget {
  static const String routeName = '/device/detail';

  @override
  _DeviceDetailPageState createState() => _DeviceDetailPageState();
}

class _DeviceDetailPageState extends State<DeviceDetailPage> {
  String _title = 'Add device';
  String _room = 'Tanya room';
  String _deviceName = 'My Home Gateway';
  String _deviceID = 'A123H47G21';
  String _location = 'Miltonia';

  void onRoomSelect() {
    Navigator.of(context).pushNamed('/room/select', arguments: _room).then((dynamic result) {
      setState(() {
        if (result != null) {
          _room = result;
        }
      });
    });
  }

  void onRemove() {
    Navigator.of(context).pushNamed('/device/remove');
  }

  void onSave() {
    // if save successfully?
    if (true) {
      // use one per needs
      Navigator.of(context).pop();
//      Navigator.of(context).pushNamed('/dashboard');
    }
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      final String params = ModalRoute.of(context).settings.arguments;
      if (params != null) {
        setState(() {
          _title = params;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      title: _title,
      backgroundColor: darkerColor,
      actionBarTintColor: lighterColor,
      padding: EdgeInsets.zero,
      wrapScroll: true,
      child: SheetContainer(
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Device name
            SizedBox(height: 8.0),
            Text('DEVICE NAME'),
            SizedBox(height: 8.0),
            Input(
              initialValue: _deviceName,
              prefix: SvgPicture.asset('assets/device/ic_gateway.svg', color: lightTextColor),
              onChanged: (value, isValid) {
                setState(() {
                  _deviceName = value;
                });
              },
            ),

            // Device ID
            SizedBox(height: 24.0),
            Text('DEVICE NAME'),
            SizedBox(height: 8.0),
            Text(_deviceID, style: bodyStyleDark),

            // Location
            SizedBox(height: 24.0),
            Text('Location'),
            SizedBox(height: 8.0),
            Text(_location, style: bodyStyleDark),

            // room
            SizedBox(height: 32.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                gradient: LinearGradient(
                  colors: [c(0xFF986EFF), c(0xFF6D5CFF)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: MaterialButton(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: Row(children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(_room, style: bodyStyleBold),
                        SizedBox(height: 4.0),
                        Text('Room', style: captionStyle.merge(t(color: Colors.white))),
                      ],
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Center(
                    child: Icon(Icons.chevron_right, color: Colors.white),
                  ),
                ]),
                onPressed: onRoomSelect,
              ),
            ),

            Expanded(child: Container()),

            // save
            SecondaryButton(
              title: 'Save',
              onPressed: onSave,
            ),

            // remove
            SizedBox(height: 8.0),
            Center(
              child: PlainButton(
                title: 'Remove device',
                onPressed: onRemove,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
