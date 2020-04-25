import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/widgets/input.dart';
import 'package:smart_home_iot/widgets/secondary_button.dart';
import 'package:smart_home_iot/widgets/title_text.dart';

class CreateRoomPage extends StatefulWidget {
  static const String routeName = '/room/create';

  @override
  _CreateRoomPageState createState() => _CreateRoomPageState();
}

class _CreateRoomPageState extends State<CreateRoomPage> {
  String _room;

  void onAdd() {
    Navigator.of(context).pop(_room);
  }

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TitleText('Add', titleBlue: 'new room'),
          SizedBox(height: 8.0),
          Text('Create your own room name'),

          // room name
          SizedBox(height: 48.0),
          Input(
            labelText: 'Room name',
            initialValue: _room,
            prefix: SvgPicture.asset('assets/edit_room.svg'),
            onChanged: (value, isValid) {
              setState(() {
                _room = value;
              });
            },
          ),

          Expanded(child: Container()),

          // add button
          SizedBox(height: 24.0),
          SecondaryButton(
            title: 'Add room name',
            onPressed: onAdd,
          ),
        ],
      ),
    );
  }
}
