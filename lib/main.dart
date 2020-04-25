import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_home_iot/screens/auth/forgot_password.dart';
import 'package:smart_home_iot/screens/auth/login.dart';
import 'package:smart_home_iot/screens/auth/reset_password.dart';
import 'package:smart_home_iot/screens/auth/signup.dart';
import 'package:smart_home_iot/screens/dashboard/dashboard.dart';
import 'package:smart_home_iot/screens/dashboard/dashboard_device.dart';
import 'package:smart_home_iot/screens/dashboard/dashboard_room.dart';
import 'package:smart_home_iot/screens/device/add_device.dart';
import 'package:smart_home_iot/screens/device/connecting_device.dart';
import 'package:smart_home_iot/screens/device/connected_device.dart';
import 'package:smart_home_iot/screens/device/device.dart';
import 'package:smart_home_iot/screens/device/device404.dart';
import 'package:smart_home_iot/screens/device/device_detail.dart';
import 'package:smart_home_iot/screens/device/remove_device.dart';
import 'package:smart_home_iot/screens/device/scan_device.dart';
import 'package:smart_home_iot/screens/home/add_room.dart';
import 'package:smart_home_iot/screens/home/create_home.dart';
import 'package:smart_home_iot/screens/home/create_room.dart';
import 'package:smart_home_iot/screens/home/edit_home.dart';
import 'package:smart_home_iot/screens/home/remove_home.dart';
import 'package:smart_home_iot/screens/home/room.dart';
import 'package:smart_home_iot/screens/home/room404.dart';
import 'package:smart_home_iot/screens/home/select_room.dart';
import 'package:smart_home_iot/screens/intro.dart';
import 'package:smart_home_iot/screens/menu.dart';
import 'package:smart_home_iot/screens/settings/about.dart';
import 'package:smart_home_iot/screens/settings/accept_invite.dart';
import 'package:smart_home_iot/screens/settings/add_sub_account.dart';
import 'package:smart_home_iot/screens/settings/contact_us.dart';
import 'package:smart_home_iot/screens/settings/help.dart';
import 'package:smart_home_iot/screens/settings/history.dart';
import 'package:smart_home_iot/screens/settings/notification.dart';
import 'package:smart_home_iot/screens/settings/notification_detail.dart';
import 'package:smart_home_iot/screens/settings/privacy_policy.dart';
import 'package:smart_home_iot/screens/settings/profile.dart';
import 'package:smart_home_iot/screens/settings/remove_sub_account.dart';
import 'package:smart_home_iot/screens/settings/settings.dart';
import 'package:smart_home_iot/screens/settings/sub_accounts.dart';
import 'package:smart_home_iot/screens/splash.dart';
import 'package:smart_home_iot/screens/start.dart';
import 'package:smart_home_iot/utils/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (_) => SplashPage(),
        '/intro': (_) => IntroPage(),
        '/start': (_) => StartPage(),

        // auth
        '/login': (_) => LogInPage(),
        '/register': (_) => SignUpPage(),
        '/forgotPassword': (_) => ForgotPasswordPage(),
        '/resetPassword': (_) => ResetPasswordPage(),

        // dashboard
        '/dashboard': (_) => DashboardPage(),
        '/dashboard/edit/room': (_) => DashboardRoomPage(),
        '/dashboard/edit/device': (_) => DashboardDevicePage(),

        // home & room
        '/home/create': (_) => CreateHomePage(),
        '/home/edit': (_) => EditHomePage(),
        '/home/remove': (_) => RemoveHomePage(),
        '/room': (_) => RoomPage(),
        '/room/create': (_) => CreateRoomPage(),
        '/room/add': (_) => AddRoomPage(),
        '/room/select': (_) => SelectRoomPage(),
        '/room/404': (_) => Room404Page(),

        // device
        '/device': (_) => DevicePage(),
        '/device/add': (_) => AddDevicePage(),
        '/device/scan': (_) => ScanDevicePage(),
        '/device/connecting': (_) => ConnectingDevicePage(),
        '/device/connected': (_) => ConnectedDevicePage(),
        '/device/detail': (_) => DeviceDetailPage(),
        '/device/remove': (_) => RemoveDevicePage(),
        '/device/404': (_) => Device404Page(),

        // menu
        '/menu': (_) => MenuPage(),

        // profile
        '/profile': (_) => ProfilePage(),
        '/profile/sub': (_) => SubAccountsPage(),
        '/profile/sub/add': (_) => AddSubAccountPage(),
        '/profile/sub/remove': (_) => RemoveSubAccountPage(),
        '/profile/accept': (_) => AcceptInvitePage(),

        // settings
        '/settings': (_) => SettingsPage(),
        '/privacy': (_) => PrivacyPolicyPage(),
        '/about': (_) => AboutPage(),
        '/history': (_) => HistoryPage(),
        '/notification': (_) => NotificationPage(),
        '/notification/detail': (_) => NotificationDetailPage(),
        '/help': (_) => HelpPage(),
        '/contactUs': (_) => ContactUsPage(),
      },
      title: 'Smart Home IoT',
      theme: ThemeData(
        fontFamily: 'SF-UI',
        backgroundColor: pageBackgroundColor,
        textTheme: TextTheme(
          body1: bodyStyle,
        ),
        primarySwatch: Colors.blue,
      ),
    );
  }
}
