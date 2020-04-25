import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/widgets/input.dart';
import 'package:smart_home_iot/widgets/plain_button.dart';
import 'package:smart_home_iot/widgets/primary_button.dart';
import 'package:smart_home_iot/widgets/sheet_container.dart';

class EditHomePage extends StatefulWidget {
  static const String routeName = '/home/edit';

  @override
  _EditHomePageState createState() => _EditHomePageState();
}

class _EditHomePageState extends State<EditHomePage> {
  String _homeName;
  String _homeAddress;
  int _wallpaper = 0;

  final fn1 = FocusNode();
  final fn2 = FocusNode();

  void onSave() {
    // create success
    if (true) {
      Navigator.of(context).pop();
    }
  }

  void onRemove() {
    Navigator.of(context).pushNamed('/home/remove');
  }

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      title: 'Manage home',
      backgroundColor: darkerColor,
      actionBarTintColor: lighterColor,
      padding: EdgeInsets.zero,
      wrapScroll: true,
      child: SheetContainer(
        padding: EdgeInsets.symmetric(vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Home name
            SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text('DEVICE NAME'),
            ),
            SizedBox(height: 8.0),
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
                  });
                },
              ),
            ),

            // Home address
            SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text('ADDRESS'),
            ),
            SizedBox(height: 8.0),
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

            // save button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: PrimaryButton(
                title: 'Save',
                onPressed: onSave,
              ),
            ),

            // remove button
            SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Center(
                child: PlainButton(
                  title: 'Remove Home',
                  onPressed: onRemove,
                ),
              ),
            ),
          ],
        ),
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
}
