import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/widgets/circular_item.dart';

class MenuPage extends StatefulWidget {
  static const String routeName = '/menu';

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return CommonPage(
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset('assets/ic_profile.svg'),
          onPressed: () => Navigator.of(context).pushNamed('/profile'),
        ),
        IconButton(
          icon: SvgPicture.asset('assets/ic_setting.svg'),
          onPressed: () => Navigator.of(context).pushNamed('/settings'),
        ),
      ],
      child: Column(children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              // Username
              Row(children: <Widget>[
                Text('Miltonia', style: titleStyleBlue),
                SizedBox(width: 24.0),
                Icon(Icons.chevron_right, color: c(0xFF223558)),
              ]),

              // menu category
              Wrap(
                spacing: 24.0,
                runSpacing: 24.0,
                children: [
                  CircularItem(
                    title: 'Rooms',
                    child: SvgPicture.asset('assets/ic_home.svg'),
                    onPressed: () => Navigator.of(context).pushNamed('/room'),
                  ),
                  CircularItem(
                    title: 'Devices',
                    child: SvgPicture.asset('assets/ic_device.svg'),
                    onPressed: () => Navigator.of(context).pushNamed('/device'),
                  ),
                  CircularItem(
                    title: 'Sub Accounts',
                    child: SvgPicture.asset('assets/ic_sub_accounts.svg'),
                    onPressed: () => Navigator.of(context).pushNamed('/profile/sub'),
                  ),
                  CircularItem(
                    title: 'History',
                    child: SvgPicture.asset('assets/ic_history.svg'),
                    onPressed: () => Navigator.of(context).pushNamed('/history'),
                  ),
                ],
              ),
            ],
          ),
        ),

        // separator
        Container(
          height: 28.0,
          child: Stack(children: <Widget>[
            // Dashed line
            Positioned(
              left: 2.0,
              right: 2.0,
              top: 14.0,
              height: 1.0,
              child: DottedBorder(
                dashPattern: [6, 4],
                color: lightColor,
                child: Container(),
                customPath: (size) => Path()
                  ..moveTo(0, 0.5)
                  ..lineTo(size.width, 0.5),
              ),
            ),

            // Left oval
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 16.0,
                height: 16.0,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: lightColor),
              ),
            ),

            // Right oval
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 16.0,
                height: 16.0,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: lightColor),
              ),
            ),
          ]),
        ),

        // Buttons
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Notifications
              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                height: FORM_ELEMENT_HEIGHT,
                color: Colors.white,
                elevation: 0,
                highlightElevation: 0,
                child: Text('Notifications & alerts', style: bodyStyleDark),
                onPressed: () => Navigator.of(context).pushNamed('/notification'),
              ),

              // How to use
              SizedBox(height: 16.0),
              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                height: FORM_ELEMENT_HEIGHT,
                color: Colors.white,
                elevation: 0,
                highlightElevation: 0,
                child: Text('How to use', style: bodyStyleDark),
                onPressed: () => Navigator.of(context).pushNamed('/help'),
              ),

              // Contact us
              SizedBox(height: 16.0),
              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                height: FORM_ELEMENT_HEIGHT,
                color: Colors.white,
                elevation: 0,
                highlightElevation: 0,
                child: Text('Contact us', style: bodyStyleDark),
                onPressed: () => Navigator.of(context).pushNamed('/contactUs'),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
