import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/widgets/secondary_button.dart';
import 'package:smart_home_iot/widgets/shadow_button.dart';

class DevicePage extends StatefulWidget {
  static const String routeName = '/device';

  @override
  _DevicePageState createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  final _devices = [
    DeviceData(name: 'Samsung aircon', room: 'Tanya room', icon: 'ic_air_conditioner.svg', isOnOff: true),
    DeviceData(name: 'TP Link smart plug', room: 'Tanya room', icon: 'ic_plug.svg', isOnOff: true),
    DeviceData(name: 'Philip Hue Light', room: 'Tanya room', icon: 'ic_lighting.svg', isOnOff: true),
    DeviceData(name: 'Xiaomi Curtain', room: 'Tanya room', icon: 'ic_curtains.svg', isOnOff: true),
    DeviceData(name: 'Motion Sensor', room: 'Tanya room', icon: 'ic_motion_sensor.svg', isOnOff: false),
  ];

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
            child: Text('Devices', style: titleStyle),
          ),
          SizedBox(height: 24.0),

          // List
          Expanded(
            child: ListView.builder(
              itemCount: _devices.length,
              itemBuilder: (context, index) => _deviceItem(index),
            ),
          ),

          // button
          SizedBox(height: 24.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SecondaryButton(
              title: 'Add new room',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _deviceItem(int index) {
    final device = _devices[index];

    return ShadowButton(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(children: <Widget>[
        Column(
          children: <Widget>[
            SvgPicture.asset(
              'assets/device/${device.icon}',
              width: 24.0,
              fit: BoxFit.contain,
              alignment: Alignment.topCenter,
            ),
            SizedBox(height: 24.0),
          ],
        ),
        Container(
          width: 1.0,
          height: 80.0,
          margin: const EdgeInsets.only(left: 8.0, right: 16.0),
          color: lightColor,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(device.name, style: buttonStyleDark),
              SizedBox(height: 4.0),
              Text(device.room, style: captionStyle),
              SizedBox(height: 4.0),
              Text(device.isOnOff ? 'On' : 'Off', style: captionStyle),
            ],
          ),
        ),
        SizedBox(width: 8.0),
        Icon(Icons.chevron_right, color: darkTextColor),
      ]),
      onPressed: () => Navigator.of(context).pushNamed('/device/detail', arguments: 'Device details'),
    );
  }
}

class DeviceData {
  final String name;
  final String icon;
  final String room;
  final bool isOnOff;

  DeviceData({
    this.name,
    this.icon,
    this.room,
    this.isOnOff,
  });
}
