import 'package:flutter/material.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/widgets/plain_button.dart';
import 'package:smart_home_iot/widgets/secondary_button.dart';
import 'package:smart_home_iot/widgets/title_text.dart';

class AddRoomPage extends StatefulWidget {
  static const String routeName = '/room/add';

  @override
  _AddRoomPageState createState() => _AddRoomPageState();
}

class _AddRoomPageState extends State<AddRoomPage> {
  List<String> _rooms = [
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
  String _selectedRoom;

  void onDone() {
    // if select a room?
    if (_selectedRoom != null) {
      // choose one per usage
//      Navigator.of(context).pushNamed('/dashboard');
//      Navigator.of(context).pushNamed('/device/404', arguments: _selectedRoom);
      Navigator.of(context).pop(_selectedRoom);
    }
  }

  void onAddNewRoom() {
    Navigator.of(context).pushNamed('/room/create').then((room) {
      if (room != null && !_rooms.contains(room)) {
        setState(() {
          _rooms.add(room);
          _selectedRoom = room;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: PlainButton(title: 'Done', onPressed: onDone),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TitleText('Add', titleBlue: 'new room'),
          SizedBox(height: 8.0),
          Text('Select a room to your home to manage the devices together'),
          SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => _roomItem(index),
              itemCount: _rooms.length,
            ),
          ),
          SizedBox(height: 24.0),
          SecondaryButton(
            title: 'Add room name',
            onPressed: onAddNewRoom,
          ),
        ],
      ),
    );
  }

  Widget _roomItem(int index) {
    String _room = _rooms[index];

    return GestureDetector(
      onTap: () {
        if (_selectedRoom != _room) {
          setState(() {
            _selectedRoom = _room;
          });
        }
      },
      child: Container(
        height: FORM_ELEMENT_HEIGHT,
        margin: const EdgeInsets.only(top: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Row(children: <Widget>[
          Expanded(child: Text(_room, style: bodyStyleDark)),
          Container(
            width: 40,
            child: _selectedRoom == _room ? Icon(Icons.check, color: successColor) : null,
          ),
        ]),
      ),
    );
  }
}
