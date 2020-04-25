import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/utils/navigate.dart';
import 'package:smart_home_iot/widgets/input.dart';
import 'package:smart_home_iot/widgets/plain_button.dart';
import 'package:smart_home_iot/widgets/primary_button.dart';
import 'package:smart_home_iot/widgets/title_text.dart';

class CreateHomePage extends StatefulWidget {
  static const String routeName = '/home/create';

  @override
  _CreateHomePageState createState() => _CreateHomePageState();
}

class _CreateHomePageState extends State<CreateHomePage> {
  String _homeName;
  String _homeAddress;
  int _wallpaper = 0;
  bool validated = false;

  final fn1 = FocusNode();
  final fn2 = FocusNode();

  void handleSheetResult(dynamic result) {
    if (result == 'room') {
      Navigator.of(context).pushNamed('/room/add');
    } else if (result == 'home') {
      // if room exist?
      if (false) {
        Navigator.of(context).pushNamed('/dashboard');
      } else {
        Navigator.of(context).pushNamed('/room/404');
      }
    }
  }

  void onCreate() {
    // create success
    if (true) {
      showSuccess();
    }
  }

  @override
  void dispose() {
    fn1.dispose();
    fn2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      isAppBarTransparent: true,
      padding: EdgeInsets.zero,
      wrapScroll: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: TitleText('Create a', titleBlue: 'New Home'),
          ),

          // Home name
          SizedBox(height: 48.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Input(
              focusNode: fn1,
              nextFocus: fn2,
              labelText: 'Home name',
              initialValue: _homeName,
              prefix: SvgPicture.asset('assets/edit_home.svg'),
              onChanged: (value, isValid) {
                setState(() {
                  _homeName = value;
                  validated = _homeName.isNotEmpty && _homeAddress.isNotEmpty && _wallpaper > 0;
                });
              },
            ),
          ),

          // Home address
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Input(
              focusNode: fn2,
              labelText: 'Home address',
              initialValue: _homeAddress,
              prefix: SvgPicture.asset('assets/edit_location.svg'),
              onChanged: (value, isValid) {
                setState(() {
                  _homeAddress = value;
                  validated = _homeName.isNotEmpty && _homeAddress.isNotEmpty && _wallpaper > 0;
                });
              },
            ),
          ),

          // Select wallpaper
          SizedBox(height: 36.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text('Select a Wallpaper', style: bodyStyleDarkBold),
          ),

          // Wallpaper list
          SizedBox(height: 16.0),
          Container(
            height: 150.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(16, (x) => x + 1).map(_wallpaperItem).toList(),
            ),
          ),

          Expanded(child: Container()),

          // create button
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
            child: PrimaryButton(
              title: 'Create new Home',
              onPressed: validated ? onCreate : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _wallpaperItem(int index) {
    EdgeInsets _margin = EdgeInsets.only(left: 16.0);
    if (index == 1) {
      _margin = EdgeInsets.only(left: 24.0);
    } else if (index == 16) {
      _margin = EdgeInsets.only(left: 16.0, right: 24.0);
    }

    return GestureDetector(
      key: ValueKey(index),
      onTap: () {
        setState(() {
          _wallpaper = index;
          validated = _homeName.isNotEmpty && _homeAddress.isNotEmpty && _wallpaper > 0;
        });
      },
      child: Container(
        margin: _margin,
        width: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: _wallpaper == index ? highlightTextColor : Colors.transparent,
            width: 2.0,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14.0),
          child: Image.asset(
            'assets/wallpaper/Wallpaper-$index.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void showSuccess() {
    showSuccessSheet(
      context,
      child: Column(children: <Widget>[
        TitleText(
          'Yesssss! Your new home have',
          titleBlue: 'been created.',
          fontSize: 24.0,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.0),
        Text(
          'Start managing your home by adding rooms and smart devices',
          textAlign: TextAlign.center,
        ),
        Expanded(child: Container()),
        PrimaryButton(
          title: 'Select Rooms',
          onPressed: () => Navigator.of(context).pop('room'),
        ),
        SizedBox(height: 8.0),
        PlainButton(
          title: 'Go to your Home',
          onPressed: () => dismissModal(context, params: 'home'),
        ),
      ]),
      onClose: handleSheetResult,
    );
  }
}
