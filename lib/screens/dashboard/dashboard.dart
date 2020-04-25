import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/screens/menu.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/widgets/shadow_button.dart';

class DashboardPage extends StatefulWidget {
  static const String routeName = '/dashboard';

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<RoomData> _rooms = [
    RoomData(name: 'Tanya room', icon: 'ic_bathroom.svg', devices: [
      DeviceData(name: 'Samsung aircon', icon: 'ic_air_conditioner.svg', isOnOff: true),
      DeviceData(name: 'TP Link smart plug', icon: 'ic_plug.svg', isOnOff: true),
      DeviceData(name: 'Philip Hue Light', icon: 'ic_lighting.svg', isOnOff: false),
      DeviceData(name: 'Xiaomi Curtain', icon: 'ic_curtains.svg', isOnOff: false, connected: false),
    ]),
    RoomData(name: 'Living room', icon: 'ic_livingroom.svg', devices: [
      DeviceData(name: 'Samsung aircon', icon: 'ic_air_conditioner.svg', isOnOff: true),
      DeviceData(name: 'TP Link smart plug', icon: 'ic_plug.svg', isOnOff: true),
      DeviceData(name: 'Philip Hue Light', icon: 'ic_lighting.svg', isOnOff: false),
      DeviceData(name: 'Xiaomi Curtain', icon: 'ic_curtains.svg', isOnOff: true),
      DeviceData(name: 'Philip Hue Light', icon: 'ic_lighting.svg', isOnOff: false),
      DeviceData(name: 'Xiaomi Curtain', icon: 'ic_curtains.svg', isOnOff: false),
    ]),
    RoomData(name: 'Bathroom', icon: 'ic_bathroom.svg', devices: [
      DeviceData(name: 'Samsung aircon', icon: 'ic_air_conditioner.svg', isOnOff: true),
      DeviceData(name: 'Xiaomi Curtain', icon: 'ic_curtains.svg', isOnOff: true),
    ]),
  ];

  String _chartBy = 'Monthly';
  double _chartMaxConsump = 300.0;
  List<ChartData> _charts = [
    ChartData(month: 'Jan', consump1: 120.0, consump2: 60.0),
    ChartData(month: 'Feb', consump1: 90.0, consump2: 45.0),
    ChartData(month: 'Mar', consump1: 200.0, consump2: 100.0),
    ChartData(month: 'Api', consump1: 225.0, consump2: 125.0),
    ChartData(month: 'May', consump1: 120.0, consump2: 70.0),
    ChartData(month: 'Jun', consump1: 90.0, consump2: 50.0),
    ChartData(month: 'Jul', consump1: 200.0, consump2: 120.0),
    ChartData(month: 'Aug', consump1: 225.0, consump2: 105.0),
    ChartData(month: 'Sep', consump1: 120.0, consump2: 40.0),
    ChartData(month: 'Oct', consump1: 90.0, consump2: 80.0),
    ChartData(month: 'Nov', consump1: 200.0, consump2: 100.0),
    ChartData(month: 'Dec', consump1: 225.0, consump2: 75.0),
  ];

  void onRoomClicked(int index) {
    //////
  }

  void onAddRoom() {
    Navigator.of(context).pushNamed('/room/add');
  }

  void onEditDashboard() {
    Navigator.of(context).pushNamed('/dashboard/edit/room', arguments: _rooms).then((value) {
      if (value != null) {
        setState(() {
          _rooms.clear();
          _rooms.addAll(value);
        });
      }
    });
  }

  void onManageHome() {
    Navigator.of(context).pushNamed('/home/edit');
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _rooms.where((x) => x.isVisible).toList();

    return CommonPage(
      title: 'Title here',
      actionBarColor: darkerColor,
      actionBarTintColor: lighterColor,
      drawer: MenuPage(),
      padding: EdgeInsets.zero,
      backgroundImage: 'assets/wallpaper/Wallpaper-3.jpg',
      leading: Builder(
        builder: (ctx) => IconButton(
          icon: SvgPicture.asset('assets/ic_dashboard.svg'),
          onPressed: () => Scaffold.of(ctx).openDrawer(),
        ),
      ),
      actions: <Widget>[
        PopupMenuButton(
          itemBuilder: (_) => [
            PopupMenuItem(value: 1, child: Text('Add room')),
            PopupMenuItem(value: 2, child: Text('Edit dashboard')),
            PopupMenuItem(value: 3, child: Text('Manage home')),
          ],
          icon: Icon(Icons.more_horiz, color: Colors.white),
          onSelected: (value) {
            if (value == 1) {
              // add room
              onAddRoom();
            } else if (value == 2) {
              // edit dashboard
              onEditDashboard();
            } else if (value == 3) {
              // manage home
              onManageHome();
            }
          },
        ),
      ],
      child: ListView.builder(
        itemCount: filtered.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _chart();
          } else {
            return _roomItem(index - 1);
          }
        },
      ),
    );
  }

  Widget _chart() {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 150.0, bottom: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36.0),
          gradient: LinearGradient(
            colors: [c(0xFF986EFF), c(0xFF6D5CFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Total     Monthly
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Total', style: bodyStyle.merge(t(color: lighterColor))),
                  DropdownButton<String>(
                    items: [
                      DropdownMenuItem(value: 'Weekly', child: Text('Weekly', style: bodyStyleDark)),
                      DropdownMenuItem(value: 'Monthly', child: Text('Monthly', style: bodyStyleDark)),
                      DropdownMenuItem(value: 'Yearly', child: Text('Yearly', style: bodyStyleDark)),
                    ],
                    selectedItemBuilder: (_) => [
                      Text('Weekly  ', style: bodyStyleWhite),
                      Text('Monthly  ', style: bodyStyleWhite),
                      Text('Yearly  ', style: bodyStyleWhite),
                    ],
                    underline: Container(),
                    isDense: true,
                    icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
                    value: _chartBy,
                    onChanged: (value) {
                      setState(() {
                        _chartBy = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            // Kw
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text('482 Kw', style: buttonStyle.merge(t(fontSize: 24.0))),
            ),

            // Graph
            Container(
              margin: const EdgeInsets.only(top: 24.0, left: 12.0, right: 12.0),
              height: 150.0,
              child: LayoutBuilder(builder: (context, constraints) {
                double width = constraints.maxWidth / 8.0;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _charts.length,
                  itemBuilder: (context, index) => _chartCell(_charts[index], width),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chartCell(ChartData data, double width) {
    return Column(children: <Widget>[
      Expanded(
        child: LayoutBuilder(builder: (context, constraints) {
          double height1 = constraints.maxHeight * (_chartMaxConsump - data.consump1) / _chartMaxConsump;
          double height2 = constraints.maxHeight * (_chartMaxConsump - data.consump2) / _chartMaxConsump;

          return Container(
            width: 8.0,
            decoration: BoxDecoration(color: c(0xFF7C42FF), borderRadius: BorderRadius.circular(4.0)),
            child: Stack(children: <Widget>[
              Positioned.fill(
                top: height1,
                child: Container(
                  decoration: BoxDecoration(color: c(0xFF28C9E1), borderRadius: BorderRadius.circular(4.0)),
                ),
              ),
              Positioned.fill(
                top: height2,
                child: Container(
                  decoration: BoxDecoration(color: darkTextColor, borderRadius: BorderRadius.circular(4.0)),
                ),
              ),
            ]),
          );
        }),
      ),
      DottedBorder(
        dashPattern: [2, 2],
        color: lightTextColor,
        child: Container(width: width, height: 1.0),
        customPath: (size) => Path()
          ..moveTo(0, 0.5)
          ..lineTo(size.width, 0.5),
      ),
      SizedBox(height: 8.0),
      Text(data.month, style: bodyStyleWhite),
    ]);
  }

  Widget _roomItem(int index) {
    final filtered = _rooms.where((x) => x.isVisible).toList();
    final room = filtered[index];
    final bool notConnected = room.devices.any((x) => !x.connected);

    EdgeInsets margin = EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0);
    if (index == filtered.length - 1) {
      margin = margin.add(EdgeInsets.only(bottom: 24.0));
    }

    return ShadowButton(
      margin: margin,
      padding: EdgeInsets.zero,
      child: Stack(children: [
        // Offline warning
        notConnected
            ? Positioned(
                top: 4.0,
                right: 12.0,
                child: Row(children: <Widget>[
                  Icon(Icons.signal_wifi_off, color: errorColor, size: 14.0),
                  SizedBox(width: 8.0),
                  Text('OFFLINE. Check device or network connection.', style: t(fontSize: 10.0, color: errorColor)),
                ]),
              )
            : Container(),

        // room data
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0, bottom: 16.0),
          child: Row(children: <Widget>[
            // avatar
            Container(
              width: 48.0,
              height: 48.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [c(0xFFF16487), c(0xFFFC8889)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Center(
                child: SvgPicture.asset('assets/room/${room.icon}'),
              ),
            ),

            // room name and devices
            SizedBox(width: 8.0),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                // name
                Text(room.name, style: bodyStyleDarkBold),

                // devices
                SizedBox(height: 8.0),
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 4.0,
                  runSpacing: 4.0,
                  children: room.devices.map(_deviceIcon).toList(),
                ),
              ]),
            ),

            // arrow
            SizedBox(width: 8.0),
            Icon(Icons.chevron_right, color: darkTextColor),
          ]),
        ),
      ]),
      onPressed: () => onRoomClicked(index),
    );
  }

  Widget _deviceIcon(DeviceData device) {
    Widget icon = SvgPicture.asset(
      'assets/device/${device.icon}',
      width: 14.0,
      height: 14.0,
      color: device.isOnOff ? null : lightTextColor,
    );
    Widget waiting = SvgPicture.asset('assets/ic_wait_device.svg', width: 14.0, height: 14.0);

    return CircleAvatar(
      radius: 12.0,
      backgroundColor: pageBackgroundColor,
      child: device.connected
          ? icon
          : Stack(children: <Widget>[
              Center(child: icon),
              Center(child: waiting),
            ]),
    );
  }
}

class RoomData {
  final String name;
  final String icon;
  final List<DeviceData> devices;
  final bool isVisible;

  RoomData({
    this.name,
    this.icon,
    this.devices,
    this.isVisible = true,
  });
}

class DeviceData {
  final String name;
  final String icon;
  final bool isOnOff;
  final bool connected;

  DeviceData({
    this.name,
    this.icon,
    this.isOnOff,
    this.connected = true,
  });
}

class ChartData {
  final String month;
  final double consump1;
  final double consump2;

  ChartData({
    this.month,
    this.consump1,
    this.consump2,
  });
}
