import 'package:flutter/material.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/widgets/secondary_button.dart';
import 'package:smart_home_iot/widgets/sheet_container.dart';
import 'package:smart_home_iot/widgets/title_text.dart';

class Device404Page extends StatefulWidget {
  static const String routeName = '/device/404';

  @override
  _Device404PageState createState() => _Device404PageState();
}

class _Device404PageState extends State<Device404Page> {
  String _room = '';

  void onAddDevice() {
    Navigator.of(context).pushNamed('/device/add');
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      String params = ModalRoute.of(context).settings.arguments;

      if (params != null) {
        setState(() {
          _room = params;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      title: _room,
      backgroundColor: darkerColor,
      actionBarTintColor: lighterColor,
      padding: EdgeInsets.zero,
      child: SheetContainer(
        margin: EdgeInsets.zero,
        child: Column(children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Image.asset('assets/result_info.png', fit: BoxFit.contain),
            ),
          ),
          TitleText('Upppp.', titleBlue: 'There is no device', fontSize: 20.0),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Text(
              'Start adding device so we can help you manage it more carefully',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: SecondaryButton(
                title: 'Add new device',
                onPressed: onAddDevice,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
