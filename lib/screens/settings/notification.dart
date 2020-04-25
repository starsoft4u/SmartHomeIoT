import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/widgets/shadow_box.dart';
import 'package:smart_home_iot/widgets/shadow_button.dart';

class NotificationPage extends StatefulWidget {
  static const String routeName = '/noficiation';

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationData> _notifications = [
    NotificationData(message: 'Server reconnection', dateTime: DateTime(2020, 4, 8)),
    NotificationData(message: 'Master aircon disconnected', dateTime: DateTime(2020, 4, 7), isAlert: true),
    NotificationData(message: 'Unable to detect gateway', dateTime: DateTime(2020, 4, 7), isAlert: true),
    NotificationData(message: 'Added new smart devices', dateTime: DateTime(2020, 4, 6)),
  ];

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      title: 'Notification & Alerts',
      padding: EdgeInsets.zero,
      child: DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 8.0),
            TabBar(
              isScrollable: true,
              labelColor: highlightTextColor,
              unselectedLabelColor: lightTextColor,
              labelStyle: t(fontSize: 14.0, fontWeight: FontWeight.w700),
              labelPadding: const EdgeInsets.symmetric(horizontal: 24.0),
              indicatorColor: pageBackgroundColor,
              tabs: [
                Tab(text: 'View All'),
                Tab(text: 'Notifications'),
                Tab(text: 'Alerts'),
              ],
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _notificationView(0),
                  _notificationView(1),
                  _notificationView(2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _notificationView(int index) {
    var data = _notifications;
    if (index == 1) {
      data = _notifications.where((x) => !x.isAlert).toList();
    } else if (index == 2) {
      data = _notifications.where((x) => x.isAlert).toList();
    }

    final formatter = DateFormat('dd/MM/yyyy');

    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];

        List<Widget> children = [
          SvgPicture.asset('assets/${item.isAlert ? 'ic_disconnect' : 'ic_connect'}.svg'),
          Container(
            width: 1.0,
            height: 72.0,
            margin: const EdgeInsets.only(left: 8.0, right: 16.0),
            color: lightColor,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(item.message, style: bodyStyleDarkBold),
                SizedBox(height: 4.0),
                Text(formatter.format(item.dateTime), style: bodyStyle),
              ],
            ),
          ),
        ];

        if (item.isAlert) {
          return ShadowBox(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(children: children),
          );
        } else {
          children.addAll([
            SizedBox(width: 8.0),
            Icon(Icons.chevron_right, color: darkTextColor),
          ]);
          return ShadowButton(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(children: children),
            onPressed: () => Navigator.of(context).pushNamed('/notification/detail'),
          );
        }
      },
    );
  }
}

class NotificationData {
  final String message;
  final DateTime dateTime;
  final bool isAlert;

  NotificationData({
    this.message,
    this.dateTime,
    this.isAlert = false,
  });
}
