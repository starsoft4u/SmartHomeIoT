import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/widgets/secondary_button.dart';
import 'package:smart_home_iot/widgets/shadow_button.dart';

class RoomPage extends StatefulWidget {
  static const String routeName = '/room';

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  List<RoomData> _rooms = [
    RoomData(name: 'Tanya room', deviceCount: 4),
    RoomData(name: 'Living room', deviceCount: 6),
    RoomData(name: 'Bathroom', deviceCount: 1),
    RoomData(name: 'Master room', deviceCount: 3),
    RoomData(name: 'Kids room', deviceCount: 2),
    RoomData(name: 'Dining room', deviceCount: 5),
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
            child: Text('Rooms', style: titleStyle),
          ),
          SizedBox(height: 24.0),

          // List
          Expanded(
            child: ListView.builder(
              itemCount: _rooms.length,
              itemBuilder: (context, index) => _roomItem(index),
            ),
          ),

          // button
          SizedBox(height: 24.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SecondaryButton(
              title: 'Add new room',
              onPressed: () => Navigator.of(context).pushNamed('/room/add'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _roomItem(int index) {
    final room = _rooms[index];

    return ShadowButton(
      borderRadius: 12.0,
      gradient: _gradients[index % _gradients.length],
      child: Row(children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(room.name, style: bodyStyleBold),
              SizedBox(height: 4.0),
              Text('${room.deviceCount} Device(s)', style: captionStyle.merge(t(color: Colors.white))),
            ],
          ),
        ),
        SizedBox(width: 8.0),
        Center(
          child: Icon(Icons.chevron_right, color: Colors.white),
        ),
      ]),
      onPressed: () {},
    );
  }

  final _gradients = [
    LinearGradient(colors: [c(0xFF986EFF), c(0xFF6D5CFF)], begin: Alignment.centerLeft, end: Alignment.centerRight),
    LinearGradient(colors: [c(0xFF26B9D1), c(0xFF13C2B4)], begin: Alignment.centerLeft, end: Alignment.centerRight),
    LinearGradient(colors: [c(0xFFF16487), c(0xFFFC8889)], begin: Alignment.centerLeft, end: Alignment.centerRight),
    LinearGradient(colors: [c(0xFFFFA26E), c(0xFFE36D5D)], begin: Alignment.centerLeft, end: Alignment.centerRight),
    LinearGradient(
      colors: [c(0xFFEB245B), c(0xFFEB245B), c(0xFFF5427B)],
      stops: [0.0, 0.15, 1.0],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
    LinearGradient(colors: [c(0xFF5A78F0), c(0xFF4149EF)], begin: Alignment.centerLeft, end: Alignment.centerRight),
  ];
}

class RoomData {
  final String name;
  final int deviceCount;

  RoomData({this.name, this.deviceCount});
}
