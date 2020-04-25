import 'package:flutter/material.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/widgets/sheet_container.dart';

import '../common.dart';

// 10.8

class SelectRoomPage extends StatefulWidget {
  static const String routeName = '/room/select';

  @override
  _SelectRoomPageState createState() => _SelectRoomPageState();
}

class _SelectRoomPageState extends State<SelectRoomPage> {
  final _rooms = [
    'Living room',
    'Bedroom 1',
    'Bedroom 2',
    'Bedroom 3',
    'Kids room',
    'Family room',
    'Kitchen',
    'Bathroom',
    'Dining room',
    'Dressing room',
    'Basement',
    'Outdoor',
    'Attic',
    'Media room',
    'Study room',
    'Store room',
    'Laundry room',
  ];
  String _selectedRoom = '';

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      setState(() {
        _selectedRoom = ModalRoute.of(context).settings.arguments;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      title: 'Room',
      backgroundColor: darkerColor,
      actionBarTintColor: lighterColor,
      padding: EdgeInsets.zero,
      child: SheetContainer(
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Device name
            SizedBox(height: 8.0),
            Text('Select a room to for this device'),

            // Room list
            SizedBox(height: 24.0),
            Expanded(
              child: ListView.builder(
                itemCount: _rooms.length,
                itemBuilder: (context, index) => _roomItem(index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _roomItem(int index) {
    String room = _rooms[index];

    return GestureDetector(
      onTap: () => Navigator.pop(context, room),
      child: Container(
        height: FORM_ELEMENT_HEIGHT,
        margin: const EdgeInsets.only(top: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Row(children: <Widget>[
          Expanded(child: Text(room, style: bodyStyleDark)),
          Container(
            width: 40,
            child: _selectedRoom == room ? Icon(Icons.check, color: successColor) : null,
          ),
        ]),
      ),
    );
  }
}
