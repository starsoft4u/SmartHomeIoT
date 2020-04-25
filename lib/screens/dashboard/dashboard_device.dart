import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/screens/dashboard/dashboard.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/widgets/shadow_box.dart';
import 'package:smart_home_iot/widgets/sheet_container.dart';

class DashboardDevicePage extends StatefulWidget {
  static const String routeName = '/dashboard/edit/device';

  @override
  _DashboardDevicePageState createState() => _DashboardDevicePageState();
}

class _DashboardDevicePageState extends State<DashboardDevicePage> {
  RoomData _room;

  void toggleDeviceOnOff(bool value, int index) {
    final device = _room.devices[index];

    setState(() {
      _room.devices.removeAt(index);
      _room.devices.insert(
        index,
        DeviceData(
          name: device.name,
          icon: device.icon,
          connected: device.connected,
          isOnOff: value,
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      setState(() {
        _room = ModalRoute.of(context).settings.arguments;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      title: _room?.name,
      backgroundColor: darkerColor,
      actionBarTintColor: lighterColor,
      padding: EdgeInsets.zero,
      child: SheetContainer(
        padding: const EdgeInsets.only(top: 24.0),
        child: ListView.builder(
          itemCount: _room == null ? 0 : _room.devices.length,
          itemBuilder: (context, index) => _deviceItem(index),
        ),
      ),
    );
  }

  Widget _deviceItem(int index) {
    final device = _room?.devices[index];

    return ShadowBox(
      child: Row(children: <Widget>[
        SvgPicture.asset(
          'assets/device/${device.icon}',
          color: device.isOnOff ? null : lightTextColor,
          width: 24.0,
          height: 24.0,
          fit: BoxFit.contain,
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: Text(
            device.name,
            style: device.isOnOff ? buttonStyleDark : buttonStyle.merge(t(color: lightTextColor)),
          ),
        ),
        SizedBox(width: 8.0),
        Switch(
          activeColor: c(0xFF13C2B4),
          activeTrackColor: darkerColor,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: lightTextColor,
          value: device.isOnOff,
          onChanged: (value) => toggleDeviceOnOff(value, index),
        ),
      ]),
    );
  }
}
