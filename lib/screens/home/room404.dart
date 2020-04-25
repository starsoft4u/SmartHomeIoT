import 'package:flutter/material.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/widgets/secondary_button.dart';
import 'package:smart_home_iot/widgets/sheet_container.dart';
import 'package:smart_home_iot/widgets/title_text.dart';

class Room404Page extends StatefulWidget {
  static const String routeName = '/room/404';

  @override
  _Room404PageState createState() => _Room404PageState();
}

class _Room404PageState extends State<Room404Page> {
  String _home = 'Home name here';

  void onAddRoom() {
    Navigator.of(context).pushNamed('/room/add');
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      String params = ModalRoute.of(context).settings.arguments;

      if (params != null) {
        setState(() {
          _home = params;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      title: _home,
      backgroundColor: darkerColor,
      actionBarTintColor: lighterColor,
      padding: EdgeInsets.zero,
      child: SheetContainer(
        margin: EdgeInsets.zero,
        child: Column(children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Image.asset('assets/result_room.png', fit: BoxFit.contain),
            ),
          ),
          TitleText('Upppp.', titleBlue: 'There is no room', fontSize: 20.0),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Text(
              'Start adding room before you can manage the devices',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: SecondaryButton(
                title: 'Add new room',
                onPressed: onAddRoom,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
