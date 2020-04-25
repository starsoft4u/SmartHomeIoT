import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/widgets/title_text.dart';

class PermissionSheet extends StatefulWidget {
  final void Function(bool, bool, bool, bool) onChanged;

  const PermissionSheet({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  _PermissionSheetState createState() => _PermissionSheetState();
}

class _PermissionSheetState extends State<PermissionSheet> {
  bool _grantedCamera = false;
  bool _grantedPhotoLibrary = false;
  bool _grantedNotification = false;
  bool _grantedLocation = false;

  void _requestCameraPermission() {
    setState(() {
      _grantedCamera = true;
    });
    widget.onChanged(_grantedCamera, _grantedPhotoLibrary, _grantedNotification, _grantedLocation);
  }

  void _requestPhotoLibraryPermission() {
    setState(() {
      _grantedPhotoLibrary = true;
    });
    widget.onChanged(_grantedCamera, _grantedPhotoLibrary, _grantedNotification, _grantedLocation);
  }

  void _requestNotificationPermission() {
    setState(() {
      _grantedNotification = true;
    });
    widget.onChanged(_grantedCamera, _grantedPhotoLibrary, _grantedNotification, _grantedLocation);
  }

  void _requestLocationPermission() {
    setState(() {
      _grantedLocation = true;
    });
    widget.onChanged(_grantedCamera, _grantedPhotoLibrary, _grantedNotification, _grantedLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('REQUEST ACCESS', style: captionStyle),
          TitleText('Need your', titleBlue: 'Permission', fontSize: 20.0),
          SizedBox(height: 24.0),
          _item(0),
          SizedBox(height: 16.0),
          _item(1),
          SizedBox(height: 16.0),
          _item(2),
          SizedBox(height: 16.0),
          _item(3),
        ],
      ),
    );
  }

  Widget _item(int index) {
    bool granted = (index == 0 && _grantedCamera) ||
        (index == 1 && _grantedPhotoLibrary) ||
        (index == 2 && _grantedNotification) ||
        (index == 3 && _grantedLocation);

    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        height: 72.0,
        color: Colors.white,
        child: Row(children: <Widget>[
          SvgPicture.asset(
            'assets/permission_${_permissionIcons[index]}.svg',
            fit: BoxFit.fitHeight,
            alignment: Alignment.centerLeft,
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(_permissionTitles[index], style: titleStyle.merge(t(fontSize: 15.0))),
                Text(_permissionDescs[index]),
              ],
            ),
          ),
          SizedBox(width: 8.0),
          granted
              ? Container(
                  width: 72.0,
                  height: 30.0,
                  child: Icon(Icons.check, color: successColor),
                )
              : Container(
                  width: 72.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    gradient: LinearGradient(
                      colors: [c(0xFF986EFF), c(0xFF6D5CFF)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: _button(index),
                ),
          SizedBox(width: 16.0),
        ]),
      ),
    );
  }

  Widget _button(int index) {
    return MaterialButton(
      shape: StadiumBorder(),
      child: Center(
        child: Text('Allow', style: bodyStyleBold),
      ),
      onPressed: () {
        switch (index) {
          case 0:
            {
              _requestCameraPermission();
            }
            break;
          case 1:
            {
              _requestPhotoLibraryPermission();
            }
            break;
          case 2:
            {
              _requestNotificationPermission();
            }
            break;
          case 3:
            {
              _requestLocationPermission();
            }
            break;
        }
      },
    );
  }

  final _permissionTitles = [
    'Camera',
    'Photo Library',
    'Notification',
    'Location',
  ];
  final _permissionDescs = [
    'Allow app for use to take picture.',
    'Access for save photos in your gallery.',
    'Get important information without opening app.',
    'Allow access to your location for better support.',
  ];
  final _permissionIcons = [
    'camera',
    'photo_library',
    'notification',
    'location',
  ];
}
