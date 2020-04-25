import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home_iot/models/device_icon.dart';
import 'package:smart_home_iot/screens/common.dart';
import 'package:smart_home_iot/utils/constants.dart';
import 'package:smart_home_iot/widgets/circular_item.dart';
import 'package:smart_home_iot/widgets/plain_button.dart';
import 'package:smart_home_iot/widgets/title_text.dart';

class AddDevicePage extends StatefulWidget {
  static const String routeName = '/device/add';

  @override
  _AddDevicePageState createState() => _AddDevicePageState();
}

class _AddDevicePageState extends State<AddDevicePage> with SingleTickerProviderStateMixin {
  bool _byType = true;
  String _brand;
  String _deviceByType;
  String _deviceByBrand;

  String get _selectedDevice {
    return _byType ? _deviceByType : _deviceByBrand;
  }

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_tabChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _tabChanged() {
    setState(() {
      _byType = _tabController.index == 0;
      if (!_byType) {
        _brand = null;
        _deviceByBrand = null;
      }
    });
  }

  void onDone() {
    // If selected any device
    if (_selectedDevice != null) {
      Navigator.of(context).pushNamed('/device/scan', arguments: _selectedDevice);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      padding: EdgeInsets.zero,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: PlainButton(title: 'Done', onPressed: onDone),
        ),
      ],
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TitleText('Add', titleBlue: 'new device'),
          ),
          SizedBox(height: 8.0),
          Expanded(child: _tabContent()),
        ],
      ),
    );
  }

  Widget _tabContent() {
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: highlightTextColor,
            unselectedLabelColor: lightTextColor,
            labelStyle: t(fontSize: 14.0, fontWeight: FontWeight.w700),
            labelPadding: const EdgeInsets.symmetric(horizontal: 24.0),
            indicatorColor: pageBackgroundColor,
            tabs: [Tab(text: 'By device type'), Tab(text: 'By brand')],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _deviceView(_devices),
                _brand == null ? _brandView() : _deviceView(_brands[_brand]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _brandView() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Wrap(
          spacing: 24.0,
          runSpacing: 24.0,
          children: _brands.keys.map((x) => _brandIcon(x)).toList(),
        ),
      ),
    );
  }

  Widget _brandIcon(String brand) {
    String initials = brand[0].toUpperCase();
    List<String> words = brand.split(' ');
    if (words.length > 1) {
      initials += words[1][0].toUpperCase();
    }

    return CircularItem(
      title: brand,
      backgroundColor: highlightTextColor,
      onPressed: () {
        setState(() {
          _brand = brand;
        });
      },
      child: Text(initials, style: titleStyle.merge(t(color: Colors.white))),
    );
  }

  Widget _deviceView(Map<String, List<DeviceIconModel>> data) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final category = data.keys.toList()[index];
        final devices = data[category];

        List<Widget> _children = [_categoryView(category)]..addAll(devices.map((x) => _deviceIcon(x)).toList());

        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Wrap(
            spacing: 24.0,
            runSpacing: 24.0,
            children: _children,
          ),
        );
      },
      itemCount: data.length,
    );
  }

  Widget _categoryView(String category) {
    final width = MediaQuery.of(context).size.width - 24.0 * 2;
    final height = 28.0;

    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      width: width,
      height: height,
      child: Stack(children: <Widget>[
        // Dashed line
        Positioned(
          left: 2.0,
          right: 2.0,
          top: height / 2.0,
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

        // Label
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 160.0,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(height / 2.0),
              color: darkColor,
            ),
            child: Center(child: Text(category, style: buttonStyle.merge(t(fontSize: 12.0)))),
          ),
        ),
      ]),
    );
  }

  Widget _deviceIcon(DeviceIconModel model) {
    return CircularItem(
      title: model.name,
      isSelected: _selectedDevice == model.name,
      onPressed: () {
        setState(() {
          if (_byType) {
            _deviceByType = model.name;
          } else {
            _deviceByBrand = model.name;
          }
        });
      },
      child: SvgPicture.asset('assets/device/ic_${model.icon}.svg'),
    );
  }

  final _devices = {
    'Smart Hub': [
      DeviceIconModel(name: 'Gateway', icon: 'gateway'),
    ],
    'Home Appliances': [
      DeviceIconModel(name: 'Air conditioner', icon: 'air_conditioner'),
      DeviceIconModel(name: 'TV', icon: 'tv'),
      DeviceIconModel(name: 'Air Purifier', icon: 'air_purifier'),
      DeviceIconModel(name: 'Dryer', icon: 'dryer'),
      DeviceIconModel(name: 'Humidfier', icon: 'humidfier'),
      DeviceIconModel(name: 'Refrigerator', icon: 'refrigerator'),
      DeviceIconModel(name: 'Washer', icon: 'washer'),
    ],
    'Devices': [
      DeviceIconModel(name: 'Doorbell', icon: 'doorbell'),
      DeviceIconModel(name: 'Curtains', icon: 'curtains'),
      DeviceIconModel(name: 'Z wave device', icon: 'z_wave_device'),
      DeviceIconModel(name: 'Lighting', icon: 'lighting'),
      DeviceIconModel(name: 'Switch', icon: 'switch'),
      DeviceIconModel(name: 'Plug', icon: 'plug'),
      DeviceIconModel(name: 'Door locks', icon: 'door_locks'),
      DeviceIconModel(name: 'Fan', icon: 'fan'),
      DeviceIconModel(name: 'Camera', icon: 'camera'),
    ],
    'Sensors': [
      DeviceIconModel(name: 'Thermostat sensor', icon: 'thermostat_sensor'),
      DeviceIconModel(name: 'Smoke/fire sensor', icon: 'smoke_fire_sensor'),
      DeviceIconModel(name: 'Motion sensor', icon: 'motion_sensor'),
      DeviceIconModel(name: 'Multipurpose sensor', icon: 'multipurpose_sensor'),
      DeviceIconModel(name: 'Open/closed sensor', icon: 'open_closed_sensor'),
      DeviceIconModel(name: 'Water leak sensor', icon: 'water_leak_sensor'),
      DeviceIconModel(name: 'Other', icon: 'other'),
    ],
  };

  final _brands = {
    'Samsung': {
      'Home Appliances': [
        DeviceIconModel(name: 'Air conditioner', icon: 'air_conditioner'),
        DeviceIconModel(name: 'TV', icon: 'tv'),
      ],
      'Devices': [
        DeviceIconModel(name: 'Door locks', icon: 'door_locks'),
        DeviceIconModel(name: 'Z wave device', icon: 'z_wave_device'),
      ],
      'Sensors': [
        DeviceIconModel(name: 'Motion sensor', icon: 'motion_sensor'),
        DeviceIconModel(name: 'Multipurpose sensor', icon: 'multipurpose_sensor'),
        DeviceIconModel(name: 'Other', icon: 'other'),
      ],
    },
    'Xiaomi': {
      'Home Appliances': [
        DeviceIconModel(name: 'Dryer', icon: 'dryer'),
        DeviceIconModel(name: 'TV', icon: 'tv'),
        DeviceIconModel(name: 'Humidfier', icon: 'humidfier'),
      ],
      'Devices': [
        DeviceIconModel(name: 'Lighting', icon: 'lighting'),
        DeviceIconModel(name: 'Switch', icon: 'switch'),
        DeviceIconModel(name: 'Plug', icon: 'plug'),
        DeviceIconModel(name: 'Door locks', icon: 'door_locks'),
        DeviceIconModel(name: 'Fan', icon: 'fan'),
      ],
      'Sensors': [
        DeviceIconModel(name: 'Smoke/fire sensor', icon: 'smoke_fire_sensor'),
        DeviceIconModel(name: 'Motion sensor', icon: 'motion_sensor'),
        DeviceIconModel(name: 'Open/closed sensor', icon: 'open_closed_sensor'),
        DeviceIconModel(name: 'Other', icon: 'other'),
      ],
    },
    'TP Link': {
      'Smart Hub': [
        DeviceIconModel(name: 'Gateway', icon: 'gateway'),
      ],
      'Devices': [
        DeviceIconModel(name: 'Z wave device', icon: 'z_wave_device'),
        DeviceIconModel(name: 'Switch', icon: 'switch'),
        DeviceIconModel(name: 'Plug', icon: 'plug'),
      ],
      'Sensors': [
        DeviceIconModel(name: 'Thermostat sensor', icon: 'thermostat_sensor'),
        DeviceIconModel(name: 'Open/closed sensor', icon: 'open_closed_sensor'),
      ],
    },
    'Philips': {
      'Home Appliances': [
        DeviceIconModel(name: 'Air Purifier', icon: 'air_purifier'),
        DeviceIconModel(name: 'TV', icon: 'tv'),
        DeviceIconModel(name: 'Refrigerator', icon: 'refrigerator'),
      ],
      'Devices': [
        DeviceIconModel(name: 'Doorbell', icon: 'doorbell'),
        DeviceIconModel(name: 'Door locks', icon: 'door_locks'),
        DeviceIconModel(name: 'Lighting', icon: 'lighting'),
      ],
      'Sensors': [
        DeviceIconModel(name: 'Smoke/fire sensor', icon: 'smoke_fire_sensor'),
        DeviceIconModel(name: 'Water leak sensor', icon: 'water_leak_sensor'),
        DeviceIconModel(name: 'Multipurpose sensor', icon: 'multipurpose_sensor'),
        DeviceIconModel(name: 'Other', icon: 'other'),
      ],
    },
  };
}
