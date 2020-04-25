import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/utils/constants.dart';

class HistoryPage extends StatefulWidget {
  static const String routeName = '/history';

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<HistoryData> _history = [
    HistoryData(device: 'Motion sensor', state: 'Turn off', dateTime: DateTime(2020, 4, 10, 8, 46)),
    HistoryData(device: 'Smoke sensor', state: 'Turn on', dateTime: DateTime(2020, 4, 6, 15, 51)),
    HistoryData(device: 'Xiaomi curtain', state: 'Detected', dateTime: DateTime(2020, 4, 6, 11, 12)),
    HistoryData(device: 'Samsung TV', state: 'Activated', dateTime: DateTime(2020, 4, 10, 11, 12)),
    HistoryData(device: 'Smoke sensor', state: 'Turn off', dateTime: DateTime(2020, 4, 7, 15, 51)),
    HistoryData(device: 'Master aircon', state: 'Activated', dateTime: DateTime(2020, 4, 10, 15, 51)),
    HistoryData(device: 'Xiaomi curtain', state: 'Turn off', dateTime: DateTime(2020, 4, 7, 11, 12)),
  ];

  @override
  void initState() {
    super.initState();

    // Sort descent by date
    _history.sort((x, y) => y.dateTime.compareTo(x.dateTime));
  }

  @override
  Widget build(BuildContext context) {
    final data = _group();

    return CommonPage(
      title: 'History',
      padding: EdgeInsets.zero,
      child: ListView.separated(
        itemCount: data.length,
        itemBuilder: (context, index) {
          if (data[index] is String) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              child: Text(data[index].toString(), style: bodyStyle.merge(t(color: c(0xFF6F6798)))),
            );
          } else {
            HistoryData item = data[index] as HistoryData;
            final formatter = DateFormat('HH:mm');

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(item.device, style: bodyStyleDarkBold),
                        SizedBox(height: 4.0),
                        Text(item.state, style: captionStyle),
                      ],
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(formatter.format(item.dateTime), style: captionStyle),
                ],
              ),
            );
          }
        },
        separatorBuilder: (context, index) {
          if (data[index] is String) {
            return Container();
          } else {
            return Divider(color: lightColor);
          }
        },
      ),
    );
  }

  List<dynamic> _group() {
    final formatter = DateFormat('dd/MM/yyyy');
    final dates = _history.map((x) => formatter.format(x.dateTime)).toSet().toList();

    List<dynamic> data = [];
    dates.forEach((date) {
      data.add(date);
      data.addAll(
        _history.where((x) => formatter.format(x.dateTime) == date),
      );
    });

    return data;
  }
}

class HistoryData {
  final String device;
  final String state;
  final DateTime dateTime;

  HistoryData({
    this.device,
    this.state,
    this.dateTime,
  });
}
