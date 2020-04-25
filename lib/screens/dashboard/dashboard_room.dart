import 'package:flutter/material.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/screens/dashboard/dashboard.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/widgets/secondary_button.dart';
import 'package:smart_home_iot/widgets/shadow_button.dart';
import 'package:smart_home_iot/widgets/sheet_container.dart';

class DashboardRoomPage extends StatefulWidget {
  static const String routeName = '/dashboard/edit/room';

  @override
  _DashboardRoomPageState createState() => _DashboardRoomPageState();
}

class _DashboardRoomPageState extends State<DashboardRoomPage> {
  List<RoomData> _rooms = [];

  void toggleRoom(bool value, int index) {
    final room = _rooms[index];

    setState(() {
      _rooms.removeAt(index);
      _rooms.insert(
        index,
        RoomData(
          name: room.name,
          icon: room.icon,
          devices: room.devices,
          isVisible: value,
        ),
      );
    });
  }

  void onRoomClick(int index) {
    Navigator.of(context).pushNamed('/dashboard/edit/device', arguments: _rooms[index]);
  }

  void onSave() {
    Navigator.of(context).pop(_rooms);
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      final param = ModalRoute.of(context).settings.arguments;
      setState(() {
        _rooms.addAll(param);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      title: 'Edit dashboard',
      backgroundColor: darkerColor,
      actionBarTintColor: lighterColor,
      padding: EdgeInsets.zero,
      child: SheetContainer(
        padding: const EdgeInsets.only(top: 24.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _rooms.length,
              itemBuilder: (context, index) => _roomItem(index),
            ),
          ),

          // save
          SizedBox(height: 24.0),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SecondaryButton(
              title: 'Save',
              onPressed: onSave,
            ),
          ),
        ]),
      ),
    );
  }

  Widget _roomItem(int index) {
    final room = _rooms[index];
    final connected = room.devices.where((x) => x.isOnOff).length;

    return ShadowButton(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(children: <Widget>[
        Icon(Icons.menu, color: darkTextColor),
        Container(
          width: 1.0,
          height: 100.0,
          margin: const EdgeInsets.only(left: 8.0, right: 16.0),
          color: lightColor,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(room.name, style: buttonStyleDark),
              SizedBox(height: 8.0),
              Text('$connected/${room.devices.length} devices', style: bodyStyle),
            ],
          ),
        ),
        SizedBox(width: 8.0),
        Column(children: <Widget>[
          Switch(
            activeColor: c(0xFF13C2B4),
            activeTrackColor: darkerColor,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: lightTextColor,
            value: room.isVisible,
            onChanged: (value) => toggleRoom(value, index),
          ),
          Icon(Icons.chevron_right, color: darkTextColor),
        ]),
      ]),
      onPressed: () => onRoomClick(index),
    );
  }
}
